import 'package:dartz/dartz.dart';
import 'package:onlineshop/data/model/product_image_model.dart';
import 'package:onlineshop/data/model/property_model.dart';
import 'package:onlineshop/data/model/variant_product_model.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductResponseState extends ProductState {
  Either<String,List<ProductImageModel>>? response;
  Either<String,List<VariantProductModel>>? variantProductModel;
  Either<String,String>? categoryProduct;
  Either<String,List<PropertyModel>> propertyProduct;
  
  ProductResponseState(this.response,this.variantProductModel,this.categoryProduct,this.propertyProduct);
}
