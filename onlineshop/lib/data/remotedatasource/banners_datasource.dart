import 'package:dio/dio.dart';
import 'package:onlineshop/data/model/banner_model.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/api_exception.dart';

abstract class IBannersDataSource {
  Future<List<BannerAds>> getBanners();
}

class BannerRemote implements IBannersDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerAds>> getBanners() async {
    try {
      var response = await _dio.get('collections/banner/records');
      return response.data['items'].map<BannerAds>(
        (item) {
          return BannerAds.fromMaoJson(item);
        },
      ).toList();
    } on DioError catch (ex) {
      throw ApiException(
        ex.response!.statusCode,
        ex.response!.statusMessage,
      );
    } catch (ex) {
      throw ApiException(
        0,
        'An unknown error has occurred!',
      );
    }
  }
}
