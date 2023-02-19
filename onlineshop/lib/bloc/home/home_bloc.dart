import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/bloc/home/home_event.dart';
import 'package:onlineshop/bloc/home/home_state.dart';
import 'package:onlineshop/data/repository/banners_repository.dart';
import 'package:onlineshop/data/repository/category_repository.dart';
import 'package:onlineshop/data/repository/products_repository.dart';
import 'package:onlineshop/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepositiry _bannerRepository = locator.get();
  final ICategoryRepository _categoryRepository = locator.get();
  final IProductsRepository _productsRepository = locator.get();

  HomeBloc() : super(HomeinitState()) {
    on<HomeSendRequestEvent>(
      (event, emit) async {
        emit(
          HomeLodingState(),
        );

        var bannerList = await _bannerRepository.getBanners();
        var categoryList = await _categoryRepository.getCategory();
        var productsList = await _productsRepository.getAllProducts();
        var bestSellersList =
            await _productsRepository.getBestSellersProducts();
        var hotestList = await _productsRepository.getHotestProducts();

        emit(
          HomeResponseState(
            bannerList,
            categoryList,
            productsList,
            bestSellersList,
            hotestList,
          ),
        );
      },
    );
  }
}
