/// code : "200"
/// message : "Logged out successfully"

class UserLogoutResponse {
  UserLogoutResponse({this.code, this.message});

  UserLogoutResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
  }
  String? code;
  String? message;
  UserLogoutResponse copyWith({String? code, String? message}) => UserLogoutResponse(code: code ?? this.code, message: message ?? this.message);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    return map;
  }
}
