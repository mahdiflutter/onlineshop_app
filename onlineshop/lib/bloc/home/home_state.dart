import 'package:dartz/dartz.dart';
import 'package:onlineshop/data/model/banner_model.dart';
import 'package:onlineshop/data/model/category_model.dart';
import 'package:onlineshop/data/model/product_model.dart';

abstract class HomeState {}

class HomeinitState extends HomeState {}

class HomeLodingState extends HomeState {}

class HomeResponseState extends HomeState {
  Either<String, List<BannerModel>> responseBanners;
  Either<String, List<CategoryModel>> responseCategory;
  Either<String, List<ProductModel>> responseProducts;
  Either<String, List<ProductModel>> responseBestSellersProducts;
  Either<String, List<ProductModel>> responseHotestProducts;
  HomeResponseState(
    this.responseBanners,
    this.responseCategory,
    this.responseProducts,
    this.responseBestSellersProducts,
    this.responseHotestProducts,
  );
}
