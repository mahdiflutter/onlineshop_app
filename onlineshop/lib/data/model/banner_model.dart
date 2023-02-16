class BannerAds {
  String? id;
  String? collectionId;
  String? thumbnail;
  String? categoryId;

  BannerAds(
    this.id,
    this.collectionId,
    this.thumbnail,
    this.categoryId,
  );
  factory BannerAds.fromMaoJson(Map<String, dynamic> jsonObject) {
    return BannerAds(
      jsonObject['id'],
      jsonObject['collectionId'],
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',

      jsonObject['categoryId'],
    );
  }
}
