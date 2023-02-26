import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/bloc/product/product_event.dart';
import 'package:onlineshop/bloc/product/product_state.dart';
import 'package:onlineshop/data/repository/products_gallery_repository.dart';
import 'package:onlineshop/di/di.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductGalleryRepository _productRepository = locator.get();
  ProductBloc() : super(ProductInitState()) {
    on<ProductGetDataEvent>(
      (event, emit) async {
        emit(ProductLoadingState());
        var response = await _productRepository.getGallery(event.productId);
        var variantProducts = await _productRepository.getVariantsProduct(event.productId);

        var categoryProduct = await _productRepository
            .getCategoryProduct(event.productCategoryId!);
        var propertyProduct=await _productRepository.getPropertyOfProduct("ud5m8v9ijxd81rn");

        emit(
          ProductResponseState(response, variantProducts, categoryProduct,propertyProduct),
        );
      },
    );
  }
}
