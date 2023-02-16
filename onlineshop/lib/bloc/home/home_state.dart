import 'package:onlineshop/data/model/banner_model.dart';

abstract class HomeState {}

class HomeinitState extends HomeState {}

class HomeLodingState extends HomeState {}

class HomeResponseState extends HomeState {
  List<BannerAds> response;
  HomeResponseState(this.response);
}
