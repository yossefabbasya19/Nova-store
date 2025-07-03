import 'package:ecommerce_app/features/auth/data/model/user_DM.dart';

class SigninResponse {
  final String message;
  final UserDm user;
  final String token;

  SigninResponse(
      {required this.message, required this.user, required this.token});

  factory SigninResponse.fromJson(json) {
    return SigninResponse(
        message: json['message'],
        user: UserDm.fromJson(json['user']),
        token: json["token"]);
  }
}