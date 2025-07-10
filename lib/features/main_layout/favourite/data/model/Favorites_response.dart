


import 'package:ecommerce_app/core/model/product_dm/Data.dart';

class FavoritesResponse {
  FavoritesResponse({
      this.status, 
      this.count, 
      this.data,});

  FavoritesResponse.fromJson(dynamic json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDetailsDM.fromJson(v));
      });
    }
  }
  String? status;
  int? count;
  List<ProductDetailsDM>? data;



}