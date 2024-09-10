import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky_app/Core/helpers/constants.dart';
import 'package:tasky_app/Core/helpers/enums.dart';
import 'package:tasky_app/Core/helpers/shared_pref_helper.dart';
import 'package:tasky_app/features/add_task/data/models/add_edit_task_repo.dart';
import 'package:tasky_app/features/add_task/data/models/add_edit_task_request_body.dart';
import 'package:tasky_app/features/add_task/data/models/edit_task_request_body.dart';
import 'package:tasky_app/features/add_task/logic/add_edit_task_states.dart';
import 'package:tasky_app/features/add_task/network/upload_image_service.dart';

class AddEditTaskCubit extends Cubit<AddEditTaskStates> {
  final AddEditTaskRepo _addEditTaskRepo;
  AddEditTaskCubit(this._addEditTaskRepo)
      : super(const AddEditTaskStates.initial());

  // Form fields controllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  String taskPririty = Priority.low.name;
  String taskStatus = Status.waiting.name;
  XFile? taskImage;
  bool isEdit = false;

  // Clear data
  void clearData() {
    titleController.clear();
    descriptionController.clear();
    dueDateController.clear();
    taskPririty = Priority.low.name;
    taskStatus = Status.waiting.name;
    taskImage = null;
  }

  // Upload image
  Future<void> emitUplodImageStates(BuildContext context) async {
    if (taskImage != null) {
      emit(const AddEditTaskStates.uploadImageloading());
      File image = File(taskImage!.path);
      final response = await uploadImageService(image);
      if (response != null && response.image != null) {
        emit(AddEditTaskStates.uploadImageSuccess(response.image));
        taskImage = null;
      } else {
        emit(const AddEditTaskStates.uploadImageError(
            error: 'An error occurred'));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please pick an image'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  // Create task
  Future<void> emitCreateTaskStates(String? imagePath) async {
    emit(const AddEditTaskStates.loading());
    final response = await _addEditTaskRepo.addEditTask(AddEditTaskRequestBody(
      image: imagePath!,
      title: titleController.text,
      desc: descriptionController.text,
      priority: taskPririty,
      dueDate: dueDateController.text,
    ));
    response.when(
      success: (addEditTaskResponse) =>
          emit(const AddEditTaskStates.success('')),
      failure: (error) => emit(
          AddEditTaskStates.error(error: error.apiErrorModel.message ?? '')),
    );
  }

  // Update task
  Future<void> emitUpdateTaskStates(
      String? imagePath, String taskId, BuildContext context) async {
    if (taskImage != null) {
      await emitUplodImageStates(context);
    } else {
      emit(const AddEditTaskStates.loading());
      final response = await _addEditTaskRepo.editTask(
        EditTaskRequestBody(
          image: imagePath!,
          title: titleController.text,
          status: taskStatus,
          user: await SharedPrefHelper.getSecuredString(SharedPrefKeys.userId),
          desc: descriptionController.text,
          priority: taskPririty,
          dueDate: dueDateController.text,
        ),
        taskId,
      );
      response.when(
        success: (addEditTaskResponse) =>
            emit(const AddEditTaskStates.success('')),
        failure: (error) => emit(
            AddEditTaskStates.error(error: error.apiErrorModel.message ?? '')),
      );
    }
  }
}
