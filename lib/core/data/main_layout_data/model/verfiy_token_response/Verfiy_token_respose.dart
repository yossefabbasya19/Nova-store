import 'Decoded.dart';

class VerfiyTokenRespose {
  VerfiyTokenRespose({
      this.message, 
      this.decoded,});

  VerfiyTokenRespose.fromJson(dynamic json) {
    message = json['message'];
    decoded = json['decoded'] != null ? Decoded.fromJson(json['decoded']) : null;
  }
  String? message;
  Decoded? decoded;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (decoded != null) {
      map['decoded'] = decoded?.toJson();
    }
    return map;
  }

}