import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true, genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: 'statusMessage')
  String? statusMessage;
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'data')
  T? data;

  BaseResponse({this.statusMessage, this.statusCode, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(BaseResponse<T> instance, Object? Function(T value) toJsonT) => _$BaseResponseToJson(instance, toJsonT);
}
