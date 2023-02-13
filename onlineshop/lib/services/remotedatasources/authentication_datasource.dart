import 'package:dio/dio.dart';
import 'package:onlineshop/locator/globallocator.dart';
import 'package:onlineshop/utils/apiexception_util.dart';

abstract class IAuthenticationDataSource {
  Future<void> register(
    String userName,
    String password,
    String passwordConfirm,
  );
  Future<String> login(
    String identity,
    String password,
  );
}

class AuthenticationRemote implements IAuthenticationDataSource {
  final Dio _dio = locator.get();

  @override
  Future<String> login(
    String identity,
    String password,
  ) async {
    try {
      var response = await _dio.post(
        'collections/users/auth-with-password',
        data: {
          'identity': identity,
          'password': password,
        },
      );
      return response.data['token'];
    } on DioError catch (exception) {
      throw ApiException(
        exception.response!.statusCode,
        exception.response!.statusMessage,
      );
    } catch (exception) {
      throw ApiException(
        0,
        'Uknown Erro!',
      );
    }
  }

  @override
  Future<void> register(
    String userName,
    String password,
    String passwordConfirm,
  ) async {
    try {
      var response = await _dio.post(
        'collections/users/records',
        data: {
          'username': userName,
          'password': password,
          'passwordConfirm': passwordConfirm,
        },
      );
    } on DioError catch (exception) {
      throw ApiException(
        exception.response!.statusCode,
        exception.response!.statusMessage,
      );
    } catch (exception) {
      throw ApiException(
        0,
        'uknown error!',
      );
    }
  }
}
