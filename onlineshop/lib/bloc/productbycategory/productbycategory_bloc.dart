import 'package:bloc/bloc.dart';
import 'package:onlineshop/bloc/productbycategory/productbycategory_event.dart';
import 'package:onlineshop/bloc/productbycategory/productbycategory_state.dart';
import 'package:onlineshop/data/repository/productbycategory_repository.dart';
import 'package:onlineshop/di/di.dart';

class ProductByCategoryBloc
    extends Bloc<ProductByCategoryEvent, ProductByCategoryState> {
      final IProductByCategoryRepository _repository=locator.get();
  ProductByCategoryBloc() : super(ProductByCategoryInitState()) {
    on<ProductByCategoryGetProductsEvent>(
      (event, emit)async {
        emit(
          ProductByCategoryLoadingState(),
        );
        var response=await _repository.getProductsByCategory(event.categoryId!);
        emit(ProductByCategoryResponseState(response));
      },
    );
  }
}
