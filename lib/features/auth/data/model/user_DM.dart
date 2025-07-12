import 'package:ecommerce_app/core/model/product_dm/Data.dart';

class UserDm {
  static late UserDm? currentUser;
   String email;
   String userName;
  final String? role;
  final List<String> washList;

  UserDm(
      {required this.washList,
      required this.email,
      required this.userName,
      required this.role});

  factory UserDm.fromJson(json) {
    return UserDm(
        email: json["email"],
        userName: json["name"],
        role: json['role'],
        washList: []);
  }
}
