import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:onlineshop/services/remotedatasource/authentication_datasource.dart';
import 'package:onlineshop/services/repository/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;
Future<void> initGetIt() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'http://startflutter.ir/api/',
      ),
    ),
  );

  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  //services
  //datasource
  locator.registerFactory<IAuthenticationDataSource>(
    () => AuthenticationRemote(),
  );
  //repository
  locator.registerFactory<IAuthenticationRepository>(
    () => AuthenticationRepository(),
  );
}
