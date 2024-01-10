class ItemModel {
  // item_id
  // item_name
  // item_category_id
  // item_description
  // item_seller

  int id;
  int price;
  int sellCount;
  String name;
  int categoryId;
  String description;
  String sellerUsername;
  String imagePath;

  ItemModel(this.id, this.price, this.sellCount, this.name, this.categoryId,
      this.description, this.sellerUsername, this.imagePath);
}
