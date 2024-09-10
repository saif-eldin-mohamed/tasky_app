// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      address: json['address'] as String?,
      displayName: json['displayName'] as String?,
      experienceYears: (json['experienceYears'] as num?)?.toInt(),
      level: json['level'] as String?,
      phoneNumber: json['username'] as String?,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'experienceYears': instance.experienceYears,
      'username': instance.phoneNumber,
      'displayName': instance.displayName,
      'level': instance.level,
      'address': instance.address,
    };
