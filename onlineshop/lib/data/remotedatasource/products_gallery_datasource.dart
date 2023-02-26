import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:onlineshop/data/model/product_image_model.dart';
import 'package:onlineshop/data/model/property_model.dart';
import 'package:onlineshop/data/model/variant_model.dart';
import 'package:onlineshop/data/model/variant_product_model.dart';
import 'package:onlineshop/data/model/variant_type_model.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/api_exception.dart';

abstract class IProductGalleryDatasource {
  Future<List<ProductImageModel>> getGallery(String? productId);
  Future<List<VariantTypeModel>> getVariantTypes();
  Future<List<VariantModel>> getProductVariants(String? productId);
  Future<List<VariantProductModel>> getVariantsOfProduct(String? productId);
  Future<String> getCategoryOfProduct(String? categoryId);
  Future<List<PropertyModel>> getPropertyOfProduct(String? productId);
}

class ProductGalleryRemote implements IProductGalleryDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImageModel>> getGallery(String? productId) async {
    try {
      Map<String, String> queryParametrs = {
        'filter': 'product_id="$productId"'
      };
      var response = await _dio.get(
        'collections/gallery/records',
        queryParameters: queryParametrs,
      );
      return response.data['items']
          .map<ProductImageModel>(
            (mapJson) => ProductImageModel.fromMapJson(mapJson),
          )
          .toList();
    } on DioError catch (exception) {
      throw ApiException(
        exception.response!.statusCode,
        exception.response!.statusMessage,
      );
    } catch (exception) {
      throw ApiException(
        0,
        'Uknown error!',
      );
    }
  }

  @override
  Future<List<VariantTypeModel>> getVariantTypes() async {
    try {
      var response = await _dio.get('collections/variants_type/records');
      return response.data['items']
          .map<VariantTypeModel>(
            (mapJson) => VariantTypeModel.fromMapJson(mapJson),
          )
          .toList();
    } on DioError catch (exception) {
      throw ApiException(
        exception.response!.statusCode,
        exception.response!.statusMessage,
      );
    } catch (exception) {
      throw ApiException(
        0,
        'Uknown error!',
      );
    }
  }

  @override
  Future<List<VariantModel>> getProductVariants(String? productId) async {
    Map<String, String> queryParams = {'filter': 'product_id="$productId"'};
    try {
      var response = await _dio.get('collections/variants/records',
          queryParameters: queryParams);
      return response.data['items']
          .map<VariantModel>(
            (mapJson) => VariantModel.fromMapJson(mapJson),
          )
          .toList();
    } on DioError catch (exception) {
      throw ApiException(
        exception.response!.statusCode,
        exception.response!.statusMessage,
      );
    } catch (exception) {
      throw ApiException(
        0,
        'Uknown error!',
      );
    }
  }

  @override
  Future<List<VariantProductModel>> getVariantsOfProduct(
      String? productId) async {
    var variantTypesResult = await getVariantTypes();
    var variantsResult = await getProductVariants(productId);
    List<VariantProductModel> response = [];
    for (var variantType in variantTypesResult) {
      var variant = variantsResult
          .where((element) => element.typeId == variantType.id)
          .toList();

      response.add(VariantProductModel(variantType, variant));
    }
    return response;
  }

  @override
  Future<String> getCategoryOfProduct(String? categoryId) async {
    Map<String, String> queryParams = {'filter': 'id="$categoryId"'};
    try {
      var response = await _dio.get('collections/category/records',
          queryParameters: queryParams);

      return response.data['items'][0]['title'];
    } on DioError catch (dioException) {
      throw ApiException(
        dioException.response!.statusCode,
        dioException.response!.statusMessage,
      );
    } catch (anotherException) {
      throw ApiException(
        0,
        "Uknown Errodsdsdr!",
      );
    }
  }

  @override
  Future<List<PropertyModel>> getPropertyOfProduct(String? productId) async {
    Map<String, String> queryParams = {'filter': 'product_id="$productId"'};
    try {
      var response = await _dio.get('/collections/properties/records',
          queryParameters: queryParams);
      var result = response.data['items']
          .map<PropertyModel>((property) => PropertyModel.fromMapJson(property))
          .toList();
      print(result);
      return result;
    } on DioError catch (dioException) {
      throw ApiException(
        dioException.response!.statusCode,
        dioException.response!.statusMessage,
      );
    } catch (anotherException) {
      throw ApiException(
        0,
        'Uknown Error!',
      );
    }
  }
}
