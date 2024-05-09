import '../models/product_category.dart';
import 'base_provider.dart';

class ProductCategoryProvider extends BaseProvider<ProductCategory> {
  ProductCategoryProvider() : super("Category");

  @override
  ProductCategory fromJson(data) {
    // TODO: implement fromJson
    return ProductCategory.fromJson(data);
  }
}
