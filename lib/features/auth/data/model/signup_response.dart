import 'package:ecommerce_app/features/auth/data/model/user_DM.dart';

class SignupResponse {
  final String message;
  final UserDm user;
  final String token;

  SignupResponse(
      {required this.message, required this.user, required this.token});

  factory SignupResponse.fromJson(json) {
    return SignupResponse(
        message: json['message'],
        user: UserDm.fromJson(json['user']),
        token: json["token"]);
  }
}
