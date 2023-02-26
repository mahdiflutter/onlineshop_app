import 'package:dio/dio.dart';
import 'package:onlineshop/data/model/product_model.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/api_exception.dart';

abstract class IProductsByCategoryDataSource {
  Future<List<ProductModel>> getProducts(String? categoryId);
}

class ProductsByCategoryRemote implements IProductsByCategoryDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductModel>> getProducts(String? categoryId) async {
    Map<String, String> queryParams = {'filter': 'category="$categoryId"'};
    try {
      var response = await _dio.get(
        'collections/products/records',
        queryParameters: queryParams,
      );
      print(response);
      return response.data['items']
          .map<ProductModel>(
            (item) => ProductModel.fromMapJson(item),
          )
          .toList();
    } on DioError catch (dioException) {
      throw ApiException(
        dioException.response!.statusCode,
        dioException.response!.statusMessage,
      );
    } catch (anotherException) {
      throw ApiException(
        0,
        'Uknown Erorr!',
      );
    }
  }
}
