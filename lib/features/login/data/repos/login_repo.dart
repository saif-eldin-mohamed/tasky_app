
import 'package:tasky_app/Core/networking/api_error_handler.dart';
import 'package:tasky_app/Core/networking/api_result.dart';
import 'package:tasky_app/Core/networking/api_service.dart';
import 'package:tasky_app/features/login/data/models/login_request_body.dart';
import 'package:tasky_app/features/login/data/models/login_response.dart';
import 'package:tasky_app/features/login/data/models/refresh_token_response.dart';

class LoginRepo {
  final ApiService _apiService;
  

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {

    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
   Future<ApiResult<RefreshTokenResponse>> refreshToken(
      String refreshToken) async {
    try {
      final response = await _apiService.refreshToken(refreshToken);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
