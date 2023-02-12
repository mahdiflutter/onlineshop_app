import 'package:dartz/dartz.dart';
import 'package:onlineshop/data/remotedatasource/authentication_remot.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/apiexception_util.dart';

abstract class IAuthenticationRepository {
  Future<Either<String, String>> register(
    String userName,
    String password,
    String passwordConfirm,
  );
  Future<Either<String, String>> login(
    String userName,
    String password,
  );
}

class AuthenTicationRepository implements IAuthenticationRepository {
  final IAuthenticationDataSource _dataSource = locator.get();
  @override
  Future<Either<String, String>> register(
    String userName,
    String password,
    String passwordConfirm,
  ) async {
    try {
      await _dataSource.register(userName, password, passwordConfirm);
      return const Right('ثبت نام موفقیت آمیز بود!');
    } on ApiException catch (e) {
      return const Left('خطایی رخ داد');
    }
  }

  @override
  Future<Either<String, String>> login(
    String userName,
    String password,
  ) async {
    try {
      String token = await _dataSource.login(userName, password);
      if (token.isNotEmpty) {
        return const Right('با موفقیت وارد شدید.');
      } else {
        return const Left('نام کاربری یا رمز عبور صحیح نمیباشد');
      }
    }on ApiException catch (e) {
      return Left('${e.exceptionMessage}');
    }catch (e){
      return const Left('uknown error');
    }
  }
}
