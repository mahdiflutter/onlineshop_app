abstract class ProductEvent {}

class ProductGetDataEvent extends ProductEvent {
  String? productId;
  String? productCategoryId;
  ProductGetDataEvent(this.productId,this.productCategoryId);
}
