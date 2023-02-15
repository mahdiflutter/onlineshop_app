import 'package:dio/dio.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/utils/api_exception.dart';

abstract class IAuthenticationDataSource {
  Future<String> register(
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
      
    } on DioError catch (error) {
      
      print(error.response!.data);
      throw ApiException(
        error.response!.statusCode,
        error.response!.statusMessage,
      );
    } catch (error) {
      throw ApiException(
        0,
        'not found error!',
      );
    }
  }

  @override
  Future<String> register(
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
      if (response.data['id'] != '') {
        return 'success';
      } else {
        return 'already username';
      }
    } on DioError catch (error) {
      throw ApiException(
        error.response!.statusCode,
        error.response!.statusMessage,
      );
    } catch (error) {
      throw ApiException(
        0,
        'error not found!',
      );
    }
  }
}
