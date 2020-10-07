class RegisterModel {
  int id;
  String firstName, lastName, email, password, confirmPassword, phoneNumber;

  RegisterModel({this.id, this.firstName, this.lastName,this.email, this.password, this.confirmPassword, this.phoneNumber});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        password: json['password'],
        confirmPassword: json['confirmPassword'],
        phoneNumber: json['phoneNumber'],
        );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["firstName"] = firstName;
    map["lastName"] = lastName;
    map["email"] = email;
    map["password"] = password;
    map["confirmPassword"] = confirmPassword;
    map["phoneNumber"] = phoneNumber;

    return map;
  }
}