import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/Core/helpers/extensions.dart';
import 'package:tasky_app/Core/helpers/utils_functions.dart';
import 'package:tasky_app/Core/theming/colors.dart';
import 'package:tasky_app/features/add_task/logic/add_edit_task_cubit.dart';
import 'package:tasky_app/features/add_task/logic/add_edit_task_states.dart';
import 'package:tasky_app/features/home/logic/home_cubit.dart';

class AddEditTaskBlocListener extends StatelessWidget {
  const AddEditTaskBlocListener({super.key, required this.taskId, required this.isEdit});
  final String taskId;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddEditTaskCubit, AddEditTaskStates>(
      listener: (context, state) {
        state.whenOrNull(
          uploadImageloading: () => showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            ),
          ),
          uploadImageSuccess: (imagePath) {
            if (context.read<AddEditTaskCubit>().isEdit) {
              context
                  .read<AddEditTaskCubit>()
                  .emitUpdateTaskStates(imagePath, taskId, context);
            } else {
              context.read<AddEditTaskCubit>().emitCreateTaskStates(imagePath);
            }
          },
          loading: () => showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            ),
          ),
          success: (_) {
            context.read<HomeCubit>().getTasksForFirstTime();
            context.pop();
            context.pop();
          },
          error: (error) {
            Navigator.of(context).pop();
            setupErrorState(context, error);
          },
          uploadImageError: (error) {
            context.pop();
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
