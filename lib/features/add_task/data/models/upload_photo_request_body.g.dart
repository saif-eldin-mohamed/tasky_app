// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_photo_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadPhotoRequestBody _$UploadPhotoRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UploadPhotoRequestBody(
      filePath: json['image'] as String,
    );

Map<String, dynamic> _$UploadPhotoRequestBodyToJson(
        UploadPhotoRequestBody instance) =>
    <String, dynamic>{
      'image': instance.filePath,
    };
