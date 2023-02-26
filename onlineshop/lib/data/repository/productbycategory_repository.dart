import 'package:dartz/dartz.dart';
import 'package:onlineshop/data/model/product_model.dart';
import 'package:onlineshop/data/remotedatasource/productbycategory_datasource.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/api_exception.dart';

abstract class IProductByCategoryRepository {
  Future<Either<String, List<ProductModel>>> getProductsByCategory(
      String categoryId);
}

class ProductByCategoryRepository implements IProductByCategoryRepository {
  final IProductsByCategoryDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<ProductModel>>> getProductsByCategory(
      String categoryId) async {
    try {
      var response = await _dataSource.getProducts(categoryId);
      return Right(response);
    } on ApiException catch (apiException) {
      return Left(apiException.errorMessage!);
    } catch (anotherException) {
      return const Left('Uknown Error!');
    }
  }
}
