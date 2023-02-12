import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:onlineshop/data/remotedatasource/authentication_remot.dart';
import 'package:onlineshop/data/repository/authentication_remote_repository.dart';

var locator = GetIt.instance;
Future<void> initGetIt()async{
  //dio - base url
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'http://startflutter.ir/api/',
      ),
    ),
  );

  //data sources
  locator
      .registerFactory<IAuthenticationDataSource>(() => AuthenticationRemote());

  //repositories
  locator.registerFactory<IAuthenticationRepository>(
    () => AuthenTicationRepository(),
  );
}
