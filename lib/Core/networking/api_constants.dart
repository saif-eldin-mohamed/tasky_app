class ApiConstants {
  static const String apiBaseUrl = "https://todo.iraqsapp.com/";

  static const String login = "auth/login";
  static const String signup = "auth/register";
  static const String profile = "auth/profile";
  static const String refreshToken = "auth/refresh-token";
  static const String getTodoList = "todos";
  static const String createTask = "todos";
  static const String uploadImage = "upload/image";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "No Internet";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
