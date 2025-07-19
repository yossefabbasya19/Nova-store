class UpdateUserInfoRequest {
  UpdateUserInfoRequest({
      this.name, 
      this.email, 
      this.phone,});
  String? name;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

}