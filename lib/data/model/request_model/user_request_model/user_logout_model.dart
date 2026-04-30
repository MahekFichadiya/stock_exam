/// user_id : 13

class UserLogoutModel {
  UserLogoutModel({this.userId});

  UserLogoutModel.fromJson(dynamic json) {
    userId = json['user_id'];
  }
  int? userId;
  UserLogoutModel copyWith({int? userId}) => UserLogoutModel(userId: userId ?? this.userId);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    return map;
  }
}
