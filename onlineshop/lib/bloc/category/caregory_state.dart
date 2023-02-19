import 'package:onlineshop/data/model/category_model.dart';

abstract class CategoryState {}

class CategoryLoadingState extends CategoryState {}
class CategoryInitState extends CategoryState{}
class CategoryErrorState extends CategoryState{}
class CategoryResponseState extends CategoryState {
  List<CategoryModel>? response;
  CategoryResponseState(this.response);
}
