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

  Future<void> login(
    String userName,
    String password,
  ) async {
    try {
      var user = await _connection.query(
        'SELECT * FROM users WHERE userName = @userName AND password = @password',
        substitutionValues: {
          'userName': userName,
          'password': password,
        },
      );
      if (user.isNotEmpty) {
        print('Login successful. User information: ${user.first}');
        userModel.userName = user.first[0] as String;
        userModel.name = user.first[2] as String;
        userModel.phoneNumber = user.first[3] as String;
        userModel.email = user.first[4] as String;
        userModel.age = user.first[5] as int;
        userModel.address = user.first[6] as String;
        userModel.purchasedItems = user.first[7] as int;
        userModel.balance = user.first[8] as int;
      } else {
        print('Invalid username or password');
      }
    } catch (e) {
      print('Error inserting record: $e');
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

          var currentItem = ItemModel(
            itemId,
            itemPrice,
            itemSellCount,
            itemName,
            itemCategoryId,
            itemDescription,
            sellerUsername,
            "imagePath",
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
