import 'package:dio/dio.dart';
import 'package:onlineshop/data/model/category_model.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/api_exception.dart';

abstract class ICategoryDatasource {
  Future<List<CategoryModel>> getCategory();
}

class CategoryRemote implements ICategoryDatasource {
  final Dio _dio = locator.get();
  @override
  Future<List<CategoryModel>> getCategory() async {
    try {
      var response = await _dio.get('collections/category/records');
      return response.data['items'].map<CategoryModel>(
        (item) {
         return CategoryModel.fromMapJson(item);
        },
      ).toList();
  
    } on DioError catch (ex) {
      throw ApiException(
        ex.response!.statusCode,
        ex.response!.statusMessage,
      );
    } catch (ex) {
      throw ApiException(0, 'not found errorrrrrr');
    }
  }
}
