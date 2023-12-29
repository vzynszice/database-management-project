class ItemModel {
  // item_id
  // item_name
  // item_category_id
  // item_description
  // item_seller

  int id;
  int price;
  String name;
  int categoryId;
  String description;
  String seller;
  String imagePath;

  ItemModel(this.id, this.price, this.name, this.categoryId, this.description,
      this.seller, this.imagePath);
}
