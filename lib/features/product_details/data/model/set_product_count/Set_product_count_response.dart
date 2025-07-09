import 'Data.dart';

class SetProductCountResponse {
  SetProductCountResponse({
      this.status, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

  SetProductCountResponse.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  int? numOfCartItems;
  String? cartId;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}