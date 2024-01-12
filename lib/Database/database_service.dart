import 'package:postgres/postgres.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/item/model/purchased_item_model.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';

class DataBaseService {
  late PostgreSQLConnection _connection;
  static late UserModel userModel;
  Future<void> connectToDatabase() async {
    _connection = PostgreSQLConnection(
      '10.0.2.2',
      5432, // Port number
      'hobby_market',
      username: 'postgres',
      password: '365247',
    );
    await _connection.open();
  }

  Future<void> insertRecord(
      String realName,
      String phoneNumber,
      String email,
      int age,
      String address,
      String userName,
      String password,
      int purchasedItems,
      int balance) async {
    try {
      await _connection.query(
        'INSERT INTO users VALUES (@name, @phoneNumber,@email,@age,@address,@userName,@password,@purchasedItems,@balance)',
        substitutionValues: {
          'name': realName,
          'phoneNumber': phoneNumber,
          'email': email,
          'age': age,
          'address': address,
          'userName': userName,
          'password': password,
          'purchasedItems': purchasedItems,
          'balance': balance,
        },
      );
      print('Record inserted successfully');
    } catch (e) {
      print('Error inserting record: $e');
    }
  }

  Future<UserModel?> login(
    String username,
    String password,
  ) async {
    try {
      var user = await _connection.query(
        'SELECT * FROM users WHERE userName = @username AND password = @password',
        substitutionValues: {
          'username': username,
          'password': password,
        },
      );

      if (user.isNotEmpty) {
        print('Login successful. User information: ${user.first}');
        var userData = user.first;

        userModel = UserModel(
          userData[0] as String,
          userData[1] as String,
          userData[2] as String,
          userData[3] as int,
          userData[4] as String,
          userData[5] as String,
          userData[7] as int,
          userData[8] as int,
        );

        return userModel;
      } else {
        print('Invalid username or password');
        return null;
      }
    } catch (e) {
      print('Error login $e');
      return null;
    }
  }

  Future<void> insertCard(
    int id,
  ) async {
    try {
      await _connection.query(
        'INSERT INTO cart VALUES (@id, @username)',
        substitutionValues: {
          'id': id,
          'username': userModel.userName,
        },
      );
      print('Record inserted successfully');
    } catch (e) {
      print('Error inserting record: $e');
    }
  }

  Future<List<ItemModel>> getFilteredItems({
    String? nameFilter,
    int? categoryFilter,
    int? minPrice,
    int? maxPrice,
  }) async {
    try {
      var query = 'SELECT * FROM items WHERE 1=1';

      if (nameFilter != null && nameFilter.trim().isNotEmpty) {
        query += ' AND itemName LIKE @nameFilter';
        nameFilter = nameFilter.trim();
      }

      if (categoryFilter != null) {
        query +=
            ' UNION SELECT * FROM items WHERE itemCategoryId = @categoryFilter';
      }

      if (minPrice != null) {
        query += ' UNION SELECT * FROM items WHERE itemPrice >= @minPrice';
      }

      if (maxPrice != null) {
        query += ' INTERSECT SELECT * items WHERE itemPrice <= @maxPrice';
      }

      var itemsResult = await _connection.query(query, substitutionValues: {
        'nameFilter': '%$nameFilter%',
        'categoryFilter': categoryFilter,
        'minPrice': minPrice,
        'maxPrice': maxPrice,
      });

      if (itemsResult.isNotEmpty) {
        List<ItemModel> itemList = [];

        for (var item in itemsResult) {
          int itemId = item[0];
          int itemPrice = item[1];
          int itemSellCount = item[2];
          String itemName = item[3];
          int itemCategoryId = item[4];
          String itemDescription = item[5];
          String sellerUsername = item[6];
          String imagePath = item[7];
          var currentItem = ItemModel(
            itemId,
            itemPrice,
            itemSellCount,
            itemName,
            itemCategoryId,
            itemDescription,
            sellerUsername,
            imagePath,
          );

          itemList.add(currentItem);
        }

        print('Filtered items: $itemList');

        return itemList;
      } else {
        print('No items found');
        return [];
      }
    } catch (e) {
      print('Error retrieving items: $e');
      return [];
    }
  }

  Future<List<ItemModel>> getItems({
    required String tableName,
  }) async {
    try {
      var query = 'SELECT * FROM $tableName WHERE 1=1';

      var itemsResult = await _connection.query(query);

      if (itemsResult.isNotEmpty) {
        List<ItemModel> itemList = [];

        for (var item in itemsResult) {
          int itemId = item[0];
          int itemPrice = item[1];
          int itemSellCount = item[2];
          String itemName = item[3];
          int itemCategoryId = item[4];
          String itemDescription = item[5];
          String sellerUsername = item[6];
          String imagePath = item[7];
          var currentItem = ItemModel(
            itemId,
            itemPrice,
            itemSellCount,
            itemName,
            itemCategoryId,
            itemDescription,
            sellerUsername,
            imagePath,
          );

          itemList.add(currentItem);
        }

        print('Filtered items: $itemList');

        return itemList;
      } else {
        print('No items found');
        return [];
      }
    } catch (e) {
      print('Error retrieving items: $e');
      return [];
    }
  }

  Future<bool> payment(String username, int cost,
      List<PurchasedItemModel> purchasedItems) async {
    try {
      var result = await _connection.query(
        'SELECT balance FROM users WHERE username = @username',
        substitutionValues: {
          'username': username,
        },
      );

      if (result.isNotEmpty) {
        int currentBalance = result.first[0];

        if (currentBalance >= cost) {
          int newBalance = currentBalance - cost;

          await _connection.query(
            'UPDATE users SET balance = @newBalance WHERE username = @username',
            substitutionValues: {
              'newBalance': newBalance,
              'username': username,
            },
          );

          for (int i = 0; i < purchasedItems.length; i++) {
            await insertPurchasedItem(purchasedItems[i].item.id, username,
                purchasedItems[i].quantity);
          }

          return true;
        } else {
          return false;
        }
      } else {
        print("daa");
        return false;
      }
    } catch (e) {
      print('Error updating balance: $e');
      return false;
    }
  }

  Future<void> insertPurchasedItem(int itemId, String username, int num) async {
    try {
      await _connection.query(
        'INSERT INTO purchased_items (item_id, username) VALUES (@itemId, @username)',
        substitutionValues: {
          'itemId': itemId,
          'username': username,
        },
      );
      await _connection.query(
        'UPDATE items SET item_sellcount = item_sellcount + @num WHERE item_id = @id',
        substitutionValues: {
          'num': num,
          'id': itemId,
        },
      );

      print('Record inserted successfully');
    } catch (e) {
      print('Error inserting record: $e');
    }
  }

  Future<ItemModel?> getItemInfo(int id) async {
    try {
      var item = await _connection.query(
        'SELECT * FROM items WHERE item_id = @id',
        substitutionValues: {
          'id': id,
        },
      );

      if (item.isNotEmpty) {
        var firstRow = item.first;
        return ItemModel(firstRow[0], firstRow[1], firstRow[2], firstRow[3],
            firstRow[4], firstRow[5], firstRow[6], firstRow[7]);
      } else {
        print("Item not found with id: $id");
        return null;
      }
    } catch (e) {
      print("Error while fetching item information: $e");
      return null;
    }
  }

  Future<List<ItemModel>> getCart(String userName) async {
    try {
      var itemsResult = await _connection
          .query('SELECT * FROM cart WHERE username=@username');

      if (itemsResult.isNotEmpty) {
        List<ItemModel> itemList = [];

        for (var item in itemsResult) {
          int itemId = item[0];

          var itemInfo = await getItemInfo(itemId);

          if (itemInfo != null) {
            itemList.add(itemInfo);
          }
        }

        print('All items: $itemList');

        return itemList;
      } else {
        print('No items found');
        return [];
      }
    } catch (e) {
      print('Error retrieving items: $e');
      return [];
    }
  }

  Future<void> updateChanges(
      UserModel userModel, int index, String value) async {
    try {
      if (index == 0) {
        await _connection.query(
            'UPDATE users SET username= @username WHERE username <> @username',
            substitutionValues: {'username': value});
        print("username updated");
      } else if (index == 1) {
        await _connection.query(
            'UPDATE users SET phone_number= @phone_number WHERE phone_number <> @phone_number and username=@username',
            substitutionValues: {
              'phone_number': value,
              'username': userModel.userName
            });
        print("user phone_number updated");
      } else if (index == 2) {
        await _connection.query(
            'UPDATE users SET email= @email WHERE email <> @email',
            substitutionValues: {'email': value});
        print("user email updated");
      } else if (index == 3) {
        int age = int.parse(value);
        await _connection.query('UPDATE users SET age= @age WHERE age <> @age',
            substitutionValues: {'age': age});
        print("age updated");
      } else if (index == 4) {
        await _connection.query(
            'UPDATE users SET address=@address WHERE address <> @address',
            substitutionValues: {'address': value});
        print("address updated");
      }
    } catch (e) {
      print("Error while updating user informations $e");
    }
  }
}
