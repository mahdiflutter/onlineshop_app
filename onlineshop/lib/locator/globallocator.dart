import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:onlineshop/services/remotedatasources/authentication_datasource.dart';
import 'package:onlineshop/services/repositories/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;
Future<void> initGetIt() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'http://startflutter.ir/api/',
      ),
    ),
  );
  locator.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());

  // services locator

  //datasources
  locator.registerFactory<IAuthenticationDataSource>(
    () => AuthenticationRemote(),
  );
  //repositories
  locator.registerFactory<IAuthenticationRepository>(
    () => AuthenTicationRepository(),
  );
}
