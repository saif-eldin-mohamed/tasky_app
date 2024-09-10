import 'package:json_annotation/json_annotation.dart';
part 'upload_photo_response.g.dart';

@JsonSerializable()
class UploadPhotoResponse {
String? image;
UploadPhotoResponse({
this.image
    });

  factory UploadPhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadPhotoResponseFromJson(json);
}
