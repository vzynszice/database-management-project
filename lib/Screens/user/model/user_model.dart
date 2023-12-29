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
  String birthDate;
  String address;
  int budget;
  int purchasedItems = 0;

  UserModel(this.userName, this.phoneNumber, this.email, this.birthDate,
      this.address, this.budget, this.purchasedItems);
}
