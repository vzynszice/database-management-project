import 'package:postgres/postgres.dart';
import 'package:vtproje/Screens/item/model/item_model.dart';
import 'package:vtproje/Screens/user/model/user_model.dart';

class DataBaseService {
  late PostgreSQLConnection _connection;
  late UserModel userModel;
  Future<void> connectToDatabase() async {
    _connection = PostgreSQLConnection(
      '10.0.2.2',
      5432, // Port number
      'hobby_market',
      username: 'postgres',
      password: '3469',
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

        // Initialize userModel before assigning its fields
        userModel = UserModel(
          userData[0] as String,
          userData[1] as String,
          userData[2] as String,
          userData[3] as int,
          userData[4] as String,
          userData[5] as String,
          userData[7] as int,
          userData[8] as int,
          /* userData[0] as String,
          userData[1] as String,
          userData[2] as String,
          userData[4] as String,
          userData[3] as String,
          userData[5] as int,
          userData[8] as int,
          userData[7] as int, */
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

  Future<List<ItemModel>> getItems() async {
    try {
      var itemsResult = await _connection.query('SELECT * FROM items');

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
  /* _connection.query(
        'SELECT * FROM users WHERE userName = @username AND password = @password',
        substitutionValues: {
          'username': username,
          'password': password,
        }, */

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

  Future<String> getSellerName(
    String userName,
  ) async {
    try {
      var result = await _connection.query(
        'SELECT name FROM users WHERE userName = @userName',
        substitutionValues: {
          'userName': userName,
        },
      );

      if (result.isNotEmpty) {
        String sellerName = result.first[0] as String;
        return sellerName;
      } else {
        print('Invalid username or password');
        return '';
      }
    } catch (e) {
      print('Error retrieving seller name: $e');
      return '';
    }
  }
}
