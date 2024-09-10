import 'package:json_annotation/json_annotation.dart';

part 'upload_photo_request_body.g.dart';

@JsonSerializable()
class UploadPhotoRequestBody {
  @JsonKey(name: 'image')
  final String filePath; // Path to the file

  UploadPhotoRequestBody({required this.filePath});

  Map<String, dynamic> toJson() => _$UploadPhotoRequestBodyToJson(this);
}