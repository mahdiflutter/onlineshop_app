import 'package:dartz/dartz.dart';
import 'package:onlineshop/locator/globallocator.dart';
import 'package:onlineshop/services/remotedatasources/authentication_datasource.dart';
import 'package:onlineshop/utils/apiexception_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class AuthenTicationRepository implements IAuthenticationRepository {
  final IAuthenticationDataSource _dataSorce = locator.get();
  final SharedPreferences _sharedpref = locator.get();
  @override
  Future<Either<String, String>> login(
    String identity,
    String password,
  ) async {
    try {
      String token = await _dataSorce.login(
        identity,
        password,
      );
      if (token.isNotEmpty) {
        _sharedpref.setString(
          'token',
          token,
        );

        return const Right('successfully login!');
      } else {
        return const Left('Have an Error!');
      }
    } on ApiException catch (exception) {
      return const Left('username or password isnt valid');
    } catch (exception) {
      return const Left('Uknown Error!');
    }
  }

  @override
  Future<Either<String, String>> register(
    String userName,
    String password,
    String passwordConfirm,
  ) async {
    try {
      var response = await _dataSorce.register(
        userName,
        password,
        passwordConfirm,
      );
      return const Right('successfully registeration!');
    } on ApiException catch (exception) {
      return const Left('registeration was not success fully! try again.');
    } catch (exception) {
      return const Left('Uknown error!');
    }
  }
}
