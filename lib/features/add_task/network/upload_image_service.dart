import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tasky_app/Core/networking/api_constants.dart';
import 'package:tasky_app/Core/networking/dio_factory.dart';
import 'package:tasky_app/features/add_task/data/models/upload_photo_response.dart';

Future<UploadPhotoResponse?> uploadImageService(File file) async {
  final data = FormData.fromMap({
    'image': await MultipartFile.fromFile(
      file.path,
      filename: file.path.split(Platform.pathSeparator).last,
      contentType: DioMediaType.parse('image/jpeg'),
    ),
  });
  data.clone();
  print({data.files.last.key: data.files.last.toString()});

  try {
    final response = await DioFactory.getDio().post<Map<String, dynamic>>(
      '${ApiConstants.apiBaseUrl}${ApiConstants.uploadImage}',
      data: data,
      options: Options(
        method: 'POST',
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );
    return UploadPhotoResponse.fromJson(response.data!);
  } catch (e) {
    return null;
  }
}
