import 'package:dartz/dartz.dart';
import 'package:onlineshop/data/model/product_model.dart';
import 'package:onlineshop/data/remotedatasource/products_datasource.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/api_exception.dart';

abstract class IProductsRepository {
  Future<Either<String, List<ProductModel>>> getAllProducts();
  Future<Either<String, List<ProductModel>>> getBestSellersProducts();
  Future<Either<String, List<ProductModel>>> getHotestProducts();
}

class ProductsRepository implements IProductsRepository {
  final IProductDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<ProductModel>>> getAllProducts() async {
    try {
      var response = await _dataSource.getAllProducts();
      if (response.isNotEmpty) {
        return Right(response);
      } else {
        return const Left('Something went wrong in connection to network!');
      }
    } on ApiException catch (error) {
      return Left(error.errorMessage!);
    } catch (error) {
      return const Left('Uknown Error!');
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getBestSellersProducts() async {
    try {
      var response = await _dataSource.getBestSellersProducts();
      if (response.isNotEmpty) {
        return Right(response);
      } else {
        return const Left('Something went wrong in connection to network!');
      }
    } on ApiException catch (error) {
      return Left(error.errorMessage!);
    } catch (error) {
      return const Left('Uknown Error!');
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> getHotestProducts() async {
    try {
      var response = await _dataSource.getHotestProducts();
      if (response.isNotEmpty) {
        return Right(response);
      } else {
        return const Left('Something went wrong in connection to network!');
      }
    } on ApiException catch (error) {
      return Left(error.errorMessage!);
    } catch (error) {
      return const Left('Uknown Error!');
    }
  }
}
