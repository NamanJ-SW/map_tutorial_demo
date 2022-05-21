class UserInfo {
  String? name;
  String? email;
  String? password;

  UserInfo({
    required this.name,
    required this.email,
    required this.password,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }

  @override
  String toString() {
    return '"info" : { "name": $name, "email": $email, "password": $password}';
  }
}
