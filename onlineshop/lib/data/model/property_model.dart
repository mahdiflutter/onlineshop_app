class PropertyModel {
  String? title;
  String? value;
  PropertyModel(
    this.title,
    this.value,
  );
  factory PropertyModel.fromMapJson(Map<String, dynamic> mapJson) {
    return PropertyModel(
      mapJson['title'],
      mapJson['value'],
    );
  }
}
