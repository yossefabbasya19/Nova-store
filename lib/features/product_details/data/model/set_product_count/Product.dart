import 'Subcategory.dart';
import 'Category.dart';
import 'Brand.dart';

class Product {
  Product({
      this.subcategory, 
      this.firesId,
      this.title, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.id,});

  Product.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    firesId = json['_id'];
    title = json['title'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
  List<Subcategory>? subcategory;
  String? firesId;
  String? title;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['_id'] = firesId;
    map['title'] = title;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['id'] = id;
    return map;
  }

}