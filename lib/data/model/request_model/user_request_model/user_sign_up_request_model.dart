/// full_name : "John Trader"
/// email : "john@stocks.com"
/// phone : "+971501234567"
/// password : "secret123"

class UserSignUpRequestModel {
  UserSignUpRequestModel({this.fullName, this.email, this.phone, this.password});

  UserSignUpRequestModel.fromJson(dynamic json) {
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
  }
  String? fullName;
  String? email;
  String? phone;
  String? password;
  UserSignUpRequestModel copyWith({String? fullName, String? email, String? phone, String? password}) => UserSignUpRequestModel(
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    password: password ?? this.password,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = fullName;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    return map;
  }
}
