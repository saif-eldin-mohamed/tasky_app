import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky_app/features/home/data/models/todo_response.dart';

part 'home_states.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;
const factory HomeState.getTasksLoading() = GetTasksLoading;
  const factory HomeState.getTasksSuccess(T data) = GetTasksSuccess<T>;
  const factory HomeState.getTasksError({required String error}) = GetTasksError;
  const factory HomeState.getMoreTasksLoading() = GetMoreTasksLoading;
  const factory HomeState.getMoreTasksSuccess(T data) = GetMoreTasksSuccess<T>;
  const factory HomeState.getMoreTasksError({required String error}) = GetMoreTasksError;
  const factory HomeState.changeStatusCategory({required String category, required List<TodoResponse> filteredItems}) = ChangeStatusCategory;
}
