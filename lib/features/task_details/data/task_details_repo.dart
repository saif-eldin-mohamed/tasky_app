import 'package:tasky_app/Core/networking/api_error_handler.dart';
import 'package:tasky_app/Core/networking/api_result.dart';
import 'package:tasky_app/Core/networking/api_service.dart';
import 'package:tasky_app/features/home/data/models/todo_response.dart';

class TaskDetailsRepo {
  final ApiService _apiService;

  TaskDetailsRepo(this._apiService);

  Future<ApiResult<TodoResponse>> getTodoById(id) async {
    try {
      final response = await _apiService.getTodoById(id);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }

}
