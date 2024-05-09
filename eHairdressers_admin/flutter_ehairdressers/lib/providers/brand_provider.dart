import '../models/brand.dart';
import 'base_provider.dart';

class BrandProvider extends BaseProvider<Brand> {
  BrandProvider() : super("Brand");

  @override
  Brand fromJson(data) {
    // TODO: implement fromJson
    return Brand.fromJson(data);
  }
}
