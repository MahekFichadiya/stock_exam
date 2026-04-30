/// code : "200"
/// message : "Registered successfully"
/// data : {"token":"t1zhg0kx0hth74zs7kufbatjmxhtnnqgwy56vusnfku09h9ngpw436bn4jyuum8j","user":{"id":15,"full_name":"Hinal","email":"hinal@gmail.com","phone":"+978756234576","profile_image":null,"portfolio_value":0,"available_balance":10000}}

class UserSignUpResponseModel {
  UserSignUpResponseModel({this.code, this.message, this.data});

  UserSignUpResponseModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? code;
  String? message;
  Data? data;
  UserSignUpResponseModel copyWith({String? code, String? message, Data? data}) =>
      UserSignUpResponseModel(code: code ?? this.code, message: message ?? this.message, data: data ?? this.data);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// token : "t1zhg0kx0hth74zs7kufbatjmxhtnnqgwy56vusnfku09h9ngpw436bn4jyuum8j"
/// user : {"id":15,"full_name":"Hinal","email":"hinal@gmail.com","phone":"+978756234576","profile_image":null,"portfolio_value":0,"available_balance":10000}

class Data {
  Data({this.token, this.user});

  Data.fromJson(dynamic json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? token;
  User? user;
  Data copyWith({String? token, User? user}) => Data(token: token ?? this.token, user: user ?? this.user);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

/// id : 15
/// full_name : "Hinal"
/// email : "hinal@gmail.com"
/// phone : "+978756234576"
/// profile_image : null
/// portfolio_value : 0
/// available_balance : 10000

class User {
  User({this.id, this.fullName, this.email, this.phone, this.profileImage, this.portfolioValue, this.availableBalance});

  User.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    profileImage = json['profile_image'];
    portfolioValue = json['portfolio_value'];
    availableBalance = json['available_balance'];
  }
  int? id;
  String? fullName;
  String? email;
  String? phone;
  dynamic profileImage;
  int? portfolioValue;
  int? availableBalance;
  User copyWith({int? id, String? fullName, String? email, String? phone, dynamic profileImage, int? portfolioValue, int? availableBalance}) => User(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    profileImage: profileImage ?? this.profileImage,
    portfolioValue: portfolioValue ?? this.portfolioValue,
    availableBalance: availableBalance ?? this.availableBalance,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    map['email'] = email;
    map['phone'] = phone;
    map['profile_image'] = profileImage;
    map['portfolio_value'] = portfolioValue;
    map['available_balance'] = availableBalance;
    return map;
  }
}
