/// email : "john@stocks.com"
/// password : "secret123"

class UserRequestModel {
  UserRequestModel({this.email, this.password});

  UserRequestModel.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;
  UserRequestModel copyWith({String? email, String? password}) => UserRequestModel(email: email ?? this.email, password: password ?? this.password);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
