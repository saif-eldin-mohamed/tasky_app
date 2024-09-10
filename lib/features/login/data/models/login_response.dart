import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
   @JsonKey(name: 'access_token')
  String? accessToken;
   @JsonKey(name: 'refresh_token')
  String? refreshToken;
 
  @JsonKey(name: '_id')
  String? id;
  LoginResponse({
    this.accessToken,

    this.id,
    this.refreshToken
    });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
