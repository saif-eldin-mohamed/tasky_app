import 'package:tasky_app/Core/networking/api_error_handler.dart';
import 'package:tasky_app/Core/networking/api_result.dart';
import 'package:tasky_app/Core/networking/api_service.dart';
import 'package:tasky_app/features/add_task/data/models/add_edit_task_request_body.dart';
import 'package:tasky_app/features/add_task/data/models/edit_task_request_body.dart';

class AddEditTaskRepo {
  final ApiService _apiService;
  AddEditTaskRepo(this._apiService);

  Future<ApiResult<void>> addEditTask(
      AddEditTaskRequestBody addEditTaskRequestBody) async {
    try {
      final response = await _apiService.createTask(addEditTaskRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }

  Future<ApiResult<void>> editTask(
      EditTaskRequestBody editTaskRequestBody, String taskId) async {
    try {
      final response = await _apiService.editTask(taskId, editTaskRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
