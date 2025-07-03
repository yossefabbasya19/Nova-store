class SignupRequest {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String rePassword;

  SignupRequest(
      {
        required this.name,
      required this.email,
      required this.phone,
      required this.password,
      required this.rePassword
      });

  toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "phone": phone
    };
  }
}
