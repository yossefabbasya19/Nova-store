import 'package:ecommerce_app/core/model/category_dm/category_details_dm.dart';
import 'package:ecommerce_app/core/model/category_dm/meta_data_dm.dart';

class CategoryResponse {
  final int results;
  final MetaDataDm metaDataDm;
  final List<CategoryDetailsDm> categorys;

  CategoryResponse(
      {required this.results,
      required this.metaDataDm,
      required this.categorys});

  factory CategoryResponse.fromJson(json) {
    List<CategoryDetailsDm> categorysInFactory = [];
    for (var item in json['data']) {
      categorysInFactory.add(CategoryDetailsDm.fromJson(item));
    }
    return CategoryResponse(
        results: json['results'],
        metaDataDm: MetaDataDm.fromJson(json["metadata"]),
        categorys: categorysInFactory);
  }
}
