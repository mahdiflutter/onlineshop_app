class ProductModel {
  String? category;
  String? collectionId;
  String? collectionName;
  String? description;
  int? discountPrice;
  String? id;
  String? name;
  String? popularity;
  int? price;
  int? quantity;
  String? thumbnail;
  int? realPrice;
  num? present;
  ProductModel(
    this.category,
    this.collectionId,
    this.collectionName,
    this.description,
    this.discountPrice,
    this.id,
    this.name,
    this.popularity,
    this.price,
    this.quantity,
    this.thumbnail,
  ){
    realPrice=discountPrice!+price!;
    present=((price! - realPrice!) / price!) * 100;
  }

  factory ProductModel.fromMapJson(Map<String, dynamic> mapJson) {
    return ProductModel(
      mapJson['category'],
      mapJson['collectionId'],
      mapJson['collectionName'],
      mapJson['description'],
      mapJson['discount_price'],
      mapJson['id'],
      mapJson['name'],
      mapJson['popularity'],
      mapJson['price'],
      mapJson['quantity'],
      'http://startflutter.ir/api/files/${mapJson['collectionId']}/${mapJson['id']}/${mapJson['thumbnail']}',

    );
  }
}
