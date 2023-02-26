class ProductImageModel {
  String? imageUrl;
  String? productId;
  ProductImageModel(
    this.imageUrl,
    this.productId,
  );

  factory ProductImageModel.fromMapJson(Map<String, dynamic> mapJson) {
    return ProductImageModel(
      'http://startflutter.ir/api/files/${mapJson['collectionId']}/${mapJson['id']}/${mapJson['image']}',
      mapJson['product_id'],
    );
  }
}
