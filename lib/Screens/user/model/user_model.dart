class UserModel {
  String name;
  String phoneNumber;
  String email;
  int age;
  String address;
  String userName;
  int purchasedItems = 0;
  int balance;

  UserModel(this.name, this.phoneNumber, this.email, this.age, this.address,
      this.userName, this.balance, this.purchasedItems);
}
  /* -- username
	-- password (sha256)
	-- name
	-- phone_number
	-- email
	-- birth_date
	-- address
	-- num_purchased_items */