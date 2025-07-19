import 'Metadata.dart';
import 'Data.dart';

class ProductResponse {
  ProductResponse({
      this.results, 
      this.metadata, 
      this.products,});

  ProductResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      products = [];
      json['data'].forEach((v) {
        products?.add(ProductDetailsDM.fromJson(v));
      });
    }
  }
  int? results;
  Metadata? metadata;
  List<ProductDetailsDM>? products;


}