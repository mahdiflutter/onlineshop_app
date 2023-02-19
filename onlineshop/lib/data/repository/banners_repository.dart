import 'package:dartz/dartz.dart';
import 'package:onlineshop/data/model/banner_model.dart';
import 'package:onlineshop/data/remotedatasource/banners_datasource.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/api_exception.dart';

abstract class IBannerRepositiry {
  Future<Either<String, List<BannerModel>>> getBanners();
}

class BannerRepository implements IBannerRepositiry {
  final IBannersDataSource _dataSource=locator.get();
  @override
  Future<Either<String, List<BannerModel>>> getBanners() async {
    try {
      var response=await _dataSource.getBanners();
      return Right(response);
    } on ApiException catch (ex) {
      return Left(
        '${ex.errorMessage}',
      );
    } catch (ex) {
      return const Left('An unknown error has occurred');
    }
  }
}
