import 'package:dio/dio.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/apiexception_util.dart';

abstract class IAuthenticationDataSource {
  Future<void> register(
    String userName,
    String password,
    String passwordConfirm,
  );

  Future<String> login(
    String userName,
    String password,
  );
}

class AuthenticationRemote implements IAuthenticationDataSource {
  final Dio _dio = locator.get();
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
    } on DioError catch (e) {
      throw ApiException(
        e.response!.statusCode,
        e.response!.data['message'],
      );
    } catch (e) {
      print('Uknown Error!!!');
    }
  }

  @override
  Future<String> login(
    String userName,
    String password,
  ) async {
    try {
      var response = await _dio.post(
        'collections/users/auth-with-password',
        data: {
          'identity': userName,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return response.data['token'];
      }
    } on DioError catch (e) {
      throw ApiException(
        e.response!.statusCode,
        e.response!.data['message'],
      );
    }catch (ex){
      throw ApiException(0,'uknown error');
    }
    return '';
  }
}
