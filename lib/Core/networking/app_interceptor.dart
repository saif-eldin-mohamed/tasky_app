
import 'package:dio/dio.dart';
import 'package:tasky_app/Core/helpers/constants.dart';
import 'package:tasky_app/Core/networking/dio_factory.dart';
import '../helpers/shared_pref_helper.dart';
import '../networking/api_service.dart';

class AppInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(options, handler) async {
    handler.next(options);
  }

  @override
  void onError(err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.refreshToken);
      if (refreshToken != null) {
        final success = await _refreshToken(refreshToken);
        if (success) {
          FormData? newFormData;
          final requestOptions = err.response?.requestOptions;
          if (requestOptions!.data is FormData) {
            newFormData = requestOptions.data.clone();
          }

          if (requestOptions != null) {
            final newResponse = await DioFactory.getDio().request(
              requestOptions.baseUrl + requestOptions.path,
              options: Options(
                method: requestOptions.method,
              ),
              data: requestOptions.data is FormData
                  ? newFormData
                  : requestOptions.data,
              queryParameters: requestOptions.queryParameters,
            );
            return handler.resolve(newResponse);
          }
        }
      }
    }
    return super.onError(err, handler);
  }

  Future<bool> _refreshToken(String refreshToken) async {
    try {
      final apiService = ApiService(DioFactory.getDio());
      final response = await apiService.refreshToken(refreshToken);

      final accessToken = response.accessToken;

      if (accessToken != null) {
        await SharedPrefHelper.setSecuredString(
            SharedPrefKeys.accessToken, accessToken);

        DioFactory.setTokenIntoHeaderAfterLogin(accessToken);

        return true;
      }
    } catch (e) {
//
    }
    return false;
  }
}

