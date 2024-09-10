import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String phone;
  final String password;
  final String displayName;
  final int experienceYears;
  final String level;
  final String address;

  SignupRequestBody(
      {required this.phone,
      required this.password,
      required this.displayName,
      required this.experienceYears,
      required this.level,
      required this.address});

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
