import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:onlineshop/data/remotedatasource/authentication_datasource.dart';
import 'package:onlineshop/data/remotedatasource/banners_datasource.dart';
import 'package:onlineshop/data/remotedatasource/category_datasource.dart';
import 'package:onlineshop/data/remotedatasource/products_datasource.dart';
import 'package:onlineshop/data/repository/authentication_repository.dart';
import 'package:onlineshop/data/repository/banners_repository.dart';
import 'package:onlineshop/data/repository/category_repository.dart';
import 'package:onlineshop/data/repository/products_repository.dart';
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
  locator.registerFactory<IBannersDataSource>(
    () => BannerRemote(),
  );
  locator.registerFactory<IProductDataSource>(
    () => ProductsRemot(),
  );
  //repository
  locator.registerFactory<IAuthenticationRepository>(
    () => AuthenticationRepository(),
  );
  locator.registerFactory<ICategoryRepository>(
    () => CategoryRepository(),
  );
  locator.registerFactory<IBannerRepositiry>(
    () => BannerRepository(),
  );
  locator.registerFactory<IProductsRepository>(
    () => ProductsRepository(),
  );
}
