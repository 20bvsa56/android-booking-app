class LoginModel {
  String email;
  String password;

  LoginModel({this.email, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(email: json['email'], password: json['password']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["email"] = email;
    map["password"] = password;

    return map;
  }
}
