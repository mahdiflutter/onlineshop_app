class CategoryModel {
  String? collectionId;
  String? id;
  String? thumbnail;
  String? title;
  String? color;
  String? icon;

  CategoryModel(
    this.collectionId,
    this.id,
    this.thumbnail,
    this.title,
    this.color,
    this.icon,
  );

  factory CategoryModel.fromMapJson(Map<String, dynamic> mapJson) {
    return CategoryModel(
      mapJson['collectionId'],
      mapJson['id'],
      'http://startflutter.ir/api/files/${mapJson['collectionId']}/${mapJson['id']}/${mapJson['thumbnail']}',
      mapJson['title'],
      mapJson['color'],
      'http://startflutter.ir/api/files/${mapJson['collectionId']}/${mapJson['id']}/${mapJson['icon']}',
    );
  }
}
