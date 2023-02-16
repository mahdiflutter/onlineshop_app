class Category {
  String? collectionId;
  String? id;
  String? thumbnail;
  String? title;
  String? color;
  String? icon;

  Category(
    this.collectionId,
    this.id,
    this.thumbnail,
    this.title,
    this.color,
    this.icon,
  );

  factory Category.fromMapJson(Map<String, dynamic> mapJson) {
    return Category(
      mapJson['collectionId'],
      mapJson['id'],
      'http://startflutter.ir/api/files/${mapJson['collectionId']}/${mapJson['id']}/${mapJson['thumbnail']}',
      mapJson['title'],
      mapJson['color'],
      mapJson['icon'],
    );
  }
}
