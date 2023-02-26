import 'package:dartz/dartz.dart';
import 'package:onlineshop/data/model/product_image_model.dart';
import 'package:onlineshop/data/model/property_model.dart';
import 'package:onlineshop/data/model/variant_model.dart';
import 'package:onlineshop/data/model/variant_product_model.dart';
import 'package:onlineshop/data/model/variant_type_model.dart';
import 'package:onlineshop/data/remotedatasource/products_gallery_datasource.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/api_exception.dart';

abstract class IProductGalleryRepository {
  Future<Either<String, List<ProductImageModel>>> getGallery(String? productId);
  Future<Either<String, List<VariantTypeModel>>> getVariantTypes();
  Future<Either<String, List<VariantModel>>> getVariants(String? productId);
  Future<Either<String, List<VariantProductModel>>> getVariantsProduct(
      String? productId);
  Future<Either<String, String>> getCategoryProduct(String productId);
  Future<Either<String, List<PropertyModel>>> getPropertyOfProduct(
      String productId);
}

class ProductGalleryRepository implements IProductGalleryRepository {
  final IProductGalleryDatasource _dataSource = locator.get();
  @override
  Future<Either<String, List<ProductImageModel>>> getGallery(
      String? productId) async {
    try {
      var response = await _dataSource.getGallery(productId);
      return Right(response);
    } on ApiException catch (exception) {
      return Left(exception.errorMessage!);
    } catch (exception) {
      return const Left('Uknown Erroe');
    }
  }

  @override
  Future<Either<String, List<VariantTypeModel>>> getVariantTypes() async {
    try {
      var response = await _dataSource.getVariantTypes();
      return Right(response);
    } on ApiException catch (exception) {
      return Left(exception.errorMessage!);
    } catch (exception) {
      return const Left('Uknown Erroe');
    }
  }

  @override
  Future<Either<String, List<VariantModel>>> getVariants(
      String? productId) async {
    try {
      var response = await _dataSource.getProductVariants('dsdsdsd');
      return Right(response);
    } on ApiException catch (exception) {
      return Left(exception.errorMessage!);
    } catch (exception) {
      return const Left('Uknown Erroe');
    }
  }

  @override
  Future<Either<String, List<VariantProductModel>>> getVariantsProduct(
      String? productId) async {
    try {
      var response = await _dataSource.getVariantsOfProduct(productId);
      return Right(response);
    } on ApiException catch (exception) {
      return Left(exception.errorMessage!);
    } catch (exception) {
      return const Left('Uknown Erroe');
    }
  }

  @override
  Future<Either<String, String>> getCategoryProduct(String productId) async {
    try {
      var response = await _dataSource.getCategoryOfProduct(productId);
      return Right(response);
    } on ApiException catch (apiException) {
      return Left(apiException.errorMessage!);
    } catch (anotherException) {
      return const Left('Uknown Error!');
    }
  }

  @override
  Future<Either<String, List<PropertyModel>>> getPropertyOfProduct(
      String productId) async {
    try {
      var response = await _dataSource.getPropertyOfProduct('ud5m8v9ijxd81rn');
      return Right(response);
    } on ApiException catch (apiException) {
      return Left(apiException.errorMessage!);
    } catch (anotherException) {
      return const Left('Uknown Error');
    }
  }
}
