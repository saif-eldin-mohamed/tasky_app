import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponse {
   @JsonKey(name: 'access_token')
  String? accessToken;
   @JsonKey(name: 'refresh_token')
  String? refreshToken;
 
  String? displayName;
  @JsonKey(name: '_id')
  String? id;
  SignupResponse({
    this.accessToken,
    this.displayName,
    this.id,
    this.refreshToken
    });



  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

