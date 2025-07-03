class UserDm {
  static late UserDm? currentUser;
  final String email;
  final String userName;
  final String role;

  UserDm({required this.email, required this.userName, required this.role});

  factory UserDm.fromJson(json) {
    return UserDm(
        email: json["email"], userName: json["name"], role: json['role']);
  }
}
