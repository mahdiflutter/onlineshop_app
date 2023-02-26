import 'package:onlineshop/data/model/variant_model.dart';
import 'package:onlineshop/data/model/variant_type_model.dart';

class VariantProductModel {
  VariantTypeModel? type;
  List<VariantModel>? variants;
  VariantProductModel(this.type, this.variants);
}
