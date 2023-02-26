import 'package:dartz/dartz.dart';
import 'package:onlineshop/data/model/product_model.dart';

abstract class ProductByCategoryState {}

class ProductByCategoryInitState extends ProductByCategoryState {}

class ProductByCategoryLoadingState extends ProductByCategoryState {}

class ProductByCategoryResponseState extends ProductByCategoryState {
  Either<String,List<ProductModel>>? response;
  ProductByCategoryResponseState(this.response);
}
