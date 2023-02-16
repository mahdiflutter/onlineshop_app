import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:onlineshop/data/remotedatasource/authentication_datasource.dart';
import 'package:onlineshop/data/remotedatasource/category_datasource.dart';
import 'package:onlineshop/data/repository/authentication_repository.dart';
import 'package:onlineshop/data/repository/category_repository.dart';
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
  locator.registerFactory<ICategoryDatasource>(
    () => CategoryRemote(),
  );
  //repository
  locator.registerFactory<IAuthenticationRepository>(
    () => AuthenticationRepository(),
  );
  locator.registerFactory<ICategoryRepository>(
    () => CategoryRepository(),
  );
}
