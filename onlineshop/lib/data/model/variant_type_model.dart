class VariantTypeModel {
  String? id;
  String? name;
  String? title;
  String? type;

  VariantTypeModel(this.id, this.name, this.title, this.type);
  factory VariantTypeModel.fromMapJson(Map<String, dynamic> mapJson) {
    return VariantTypeModel(
      mapJson['id'],
      mapJson['name'],
      mapJson['title'],
      mapJson['type'],
    );
  }
}
