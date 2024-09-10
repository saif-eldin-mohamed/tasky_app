// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      phone: json['phone'] as String,
      password: json['password'] as String,
      displayName: json['displayName'] as String,
      experienceYears: (json['experienceYears'] as num).toInt(),
      level: json['level'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
      'displayName': instance.displayName,
      'experienceYears': instance.experienceYears,
      'level': instance.level,
      'address': instance.address,
    };
