import 'package:ecommerce_app/core/model/brands_dm/brands_details_dm.dart';
import 'package:ecommerce_app/core/model/category_dm/meta_data_dm.dart';

class BrandsResponse {
  final int results;
  final MetaDataDm metaDataDm;
  final List<BrandsDetailsDm> brandsDetailsDm;

  BrandsResponse({required this.results, required this.metaDataDm, required this.brandsDetailsDm});
  factory BrandsResponse.fromJson(json) {
    List<BrandsDetailsDm> brandsInFactory = [];
    for (var item in json['data']) {
      brandsInFactory.add(BrandsDetailsDm.fromJson(item));
    }
    return BrandsResponse(
        results: json['results'],
        metaDataDm: MetaDataDm.fromJson(json["metadata"]),
        brandsDetailsDm: brandsInFactory);
  }
}