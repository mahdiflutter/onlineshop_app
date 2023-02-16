import 'package:dartz/dartz.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/data/remotedatasource/authentication_datasource.dart';
import 'package:onlineshop/utils/api_exception.dart';

abstract class IAuthenticationRepository {
  Future<Either<String, String>> register(
    String userName,
    String password,
    String passwordConfirm,
  );
  Future<Either<String, String>> login(
    String identity,
    String password,
  );
}

class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationDataSource _dataSource = locator.get();
  @override
  Future<Either<String, String>> login(
    String identity,
    String password,
  ) async {
    try {
      var response = await _dataSource.login(
        identity,
        password,
      );
      return const Right('ورود موفقیت آمیز بود.');
    } on ApiException catch (error) {
      return const Left('نام کاربری یا رمز اشتباه میباشد.');
    } catch (error) {
      return const Left('خطای نامشخص');
    }
  }

  @override
  Future<Either<String, String>> register(
    String userName,
    String password,
    String passwordConfirm,
  ) async {
    try {
      var response = await _dataSource.register(
        userName,
        password,
        passwordConfirm,
      );
      if (response == 'success') {
        return const Right('successfully register');
      } else {
        return const Left('already user');
      }
    } on ApiException catch (error) {
      return Left(error.errorMessage!);
    } catch (error) {
      return const Left('not found this error');
    }
  }
}
