abstract class ProductByCategoryEvent{}
class ProductByCategoryGetProductsEvent extends ProductByCategoryEvent{
  String? categoryId;
  ProductByCategoryGetProductsEvent(this.categoryId);
}