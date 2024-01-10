class UserModel {
  /* -- username
	-- password (sha256)
	-- name
	-- phone_number
	-- email
	-- birth_date
	-- address
	-- num_purchased_items */
  String userName;
  String phoneNumber;
  String email;
  int age;
  String address;
  int balance;
  int purchasedItems = 0;
  String name;

  UserModel(this.userName, this.name, this.phoneNumber, this.email, this.age,
      this.address, this.balance, this.purchasedItems);
}
