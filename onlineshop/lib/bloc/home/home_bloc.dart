import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/bloc/home/home_event.dart';
import 'package:onlineshop/bloc/home/home_state.dart';
import 'package:onlineshop/data/repository/banners_repository.dart';
import 'package:onlineshop/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepositiry _bannerRepository = locator.get();
  HomeBloc() : super(HomeinitState()) {
    on<HomeSendRequestEvent>(
      (event, emit) async {
        emit(
          HomeLodingState(),
        );
        var bannerList = await _bannerRepository.getBanners();
        bannerList.fold((l){
          print(l);
        }, (r){
          emit(HomeResponseState(r));
        });
       
      },
    );
  }
}
