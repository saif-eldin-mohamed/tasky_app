import 'package:tasky_app/Core/networking/api_error_handler.dart';
import 'package:tasky_app/Core/networking/api_result.dart';
import 'package:tasky_app/Core/networking/api_service.dart';
import 'package:tasky_app/features/profile/data/profile_response.dart';

class ProfileRepo {
  final ApiService _apiService;

  ProfileRepo(this._apiService);

  Future<ApiResult<ProfileResponse>> getProfile() async {
    try {
      final response = await _apiService.getProfile();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}