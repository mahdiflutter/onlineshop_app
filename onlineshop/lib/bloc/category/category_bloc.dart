import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/bloc/category/caregory_state.dart';
import 'package:onlineshop/bloc/category/category_event.dart';
import 'package:onlineshop/data/repository/category_repository.dart';
import 'package:onlineshop/di/di.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _respository = locator.get();
  CategoryBloc() : super(CategoryInitState()) {
    on<CategoryGetEvent>((event, emit) async {
      emit(CategoryLoadingState());
      var response = await _respository.getCategory();
      response.fold(
        (l) {
          emit(CategoryErrorState());
        },
        (r) {
          emit(CategoryResponseState(r));
        },
      );
    });
  }
}
