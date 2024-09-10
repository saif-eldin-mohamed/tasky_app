import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/Core/routing/app_router.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/Core/widgets/app_text_button.dart';
import 'package:tasky_app/features/add_task/logic/add_edit_task_cubit.dart';

class AddTaskButton extends StatelessWidget {
  final AddEditTaskScreenArgs? addEditTaskScreenArgs;
  const AddTaskButton({super.key, this.addEditTaskScreenArgs});

  @override
  Widget build(BuildContext context) {
    return addEditTaskScreenArgs!.isEdit
        ? AppTextButton(
            buttonText: 'Update Task',
            textStyle: TextStyles.font19WhiteBold,
            onPressed: () {
              if (context
                  .read<AddEditTaskCubit>()
                  .formKey
                  .currentState!
                  .validate()) {
                context
                    .read<AddEditTaskCubit>()
                    .emitUpdateTaskStates(addEditTaskScreenArgs!.taskImage, addEditTaskScreenArgs!.id!, context);
              }
            },
          )
        : AppTextButton(
            buttonText: 'Add Task',
            textStyle: TextStyles.font19WhiteBold,
            onPressed: () {
              if (context
                  .read<AddEditTaskCubit>()
                  .formKey
                  .currentState!
                  .validate()) {
                context.read<AddEditTaskCubit>().emitUplodImageStates(context);
              }
            },
          );
  }
}
