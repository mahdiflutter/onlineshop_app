import 'package:dartz/dartz.dart';
import 'package:onlineshop/data/remotedatasource/category_datasource.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/api_exception.dart';
import 'package:onlineshop/data/model/category_model.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<CategoryModel>>> getCategory();
}

class CategoryRepository implements ICategoryRepository {
  final ICategoryDatasource _dataSource = locator.get();
  @override
  Future<Either<String, List<CategoryModel>>> getCategory() async {
    try {
      var response = await _dataSource.getCategory();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(ex.errorMessage!);
    } catch (ex) {
      return const Left('not found error');
    }
  }
}
