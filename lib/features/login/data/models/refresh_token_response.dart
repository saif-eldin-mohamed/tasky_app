import 'package:json_annotation/json_annotation.dart';
part 'refresh_token_response.g.dart';
@JsonSerializable()
class RefreshTokenResponse {
   @JsonKey(name: 'access_token')
  String? accessToken;
   @JsonKey(name: 'refresh_token')
  String? refreshToken;
 
  RefreshTokenResponse({
    this.accessToken,

 
    this.refreshToken
    });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
}
