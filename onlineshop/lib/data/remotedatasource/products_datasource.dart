import 'package:dio/dio.dart';
import 'package:onlineshop/data/model/product_model.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/api_exception.dart';

abstract class IProductDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<List<ProductModel>> getBestSellersProducts();
  Future<List<ProductModel>> getHotestProducts();
}

class ProductsRemot implements IProductDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      var response = await _dio.get('collections/products/records');
      return response.data!['items'].map<ProductModel>(
        (product) {
          return ProductModel.fromMapJson(product);
        },
      ).toList();
    } on DioError catch (error) {
      throw ApiException(
        error.response!.statusCode,
        error.response!.statusMessage,
      );
    } catch (error) {
      throw ApiException(0, 'Uknown error!');
    }
  }

  @override
  Future<List<ProductModel>> getBestSellersProducts() async {
    Map<String, String> filter = {'filter': 'popularity="Best Seller"'};
    try {
      var response = await _dio.get('collections/products/records',
          queryParameters: filter);

      return response.data!['items'].map<ProductModel>(
        (product) {
          return ProductModel.fromMapJson(product);
        },
      ).toList();
    } on DioError catch (error) {
      throw ApiException(
        error.response!.statusCode,
        error.response!.statusMessage,
      );
    } catch (error) {
      throw ApiException(0, 'Uknown error!');
    }
  }

  @override
  Future<List<ProductModel>> getHotestProducts() async{
    Map<String, String> filter = {'filter': 'popularity="Hotest"'};
    try {
      var response = await _dio.get('collections/products/records',
          queryParameters: filter);

      return response.data!['items'].map<ProductModel>(
        (product) {
          return ProductModel.fromMapJson(product);
        },
      ).toList();
    } on DioError catch (error) {
      throw ApiException(
        error.response!.statusCode,
        error.response!.statusMessage,
      );
    } catch (error) {
      throw ApiException(0, 'Uknown error!');
    }
    
  }
}
