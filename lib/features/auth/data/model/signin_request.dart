class SigninRequest {
  final String email;
  final String password;

  SigninRequest({required this.email, required this.password});

  toJson() {
    return {"email": email, "password": password};
  }
}
