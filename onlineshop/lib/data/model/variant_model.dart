class VariantModel {
  String? collectionId;
  String? id;
  String? typeId;
  String? name;
  String? value;
  String? productId;
  int? priceChange;

  VariantModel(
    this.collectionId,
    this.id,
    this.typeId,
    this.name,
    this.value,
    this.productId,
    this.priceChange,
  );
  factory VariantModel.fromMapJson(Map<String, dynamic> mapJson) {
    return VariantModel(
      mapJson['collectionId'],
      mapJson['id'],
      mapJson['type_id'],
      mapJson['name'],
      mapJson['value'],
      mapJson['product_id'],
      mapJson['price_change'],
    );
  }
}
