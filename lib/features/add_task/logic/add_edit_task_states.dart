import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_edit_task_states.freezed.dart';

@freezed
class AddEditTaskStates<T> with _$AddEditTaskStates<T> {
  const factory AddEditTaskStates.initial() = _Initial;
  const factory AddEditTaskStates.loading() = Loading;
  const factory AddEditTaskStates.success(T data) = Success<T>;
  const factory AddEditTaskStates.error({required String error}) = Error;
    const factory AddEditTaskStates.uploadImageloading() = UploadImageLoading;
  const factory AddEditTaskStates.uploadImageSuccess(T data) = UploadImageSuccess<T>;
  const factory AddEditTaskStates.uploadImageError({required String error}) = UploadImageError;
  
}

