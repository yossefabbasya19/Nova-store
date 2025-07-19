class Decoded {
  Decoded({
      this.id, 
      this.name, 
      this.role, 
      this.iat, 
      this.exp,});

  Decoded.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    iat = json['iat'];
    exp = json['exp'];
  }
  String? id;
  String? name;
  String? role;
  int? iat;
  int? exp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['role'] = role;
    map['iat'] = iat;
    map['exp'] = exp;
    return map;
  }

}