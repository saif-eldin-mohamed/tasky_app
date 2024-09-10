import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/helpers/enums.dart';
import 'package:tasky_app/Core/helpers/extensions.dart';
import 'package:tasky_app/Core/helpers/utils_functions.dart';
import 'package:tasky_app/Core/routing/app_router.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/Core/widgets/app_text_form_field.dart';
import 'package:tasky_app/features/add_task/logic/add_edit_task_cubit.dart';
import 'package:tasky_app/features/add_task/ui/widgets/_custom_row_drop_status_button.dart';
import 'package:tasky_app/features/add_task/ui/widgets/add_task_button.dart';
import 'package:tasky_app/features/add_task/ui/widgets/date_picker_textfield.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({
    super.key,
    this.addEditTaskScreenArgs,
  });

  final AddEditTaskScreenArgs? addEditTaskScreenArgs;

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  @override
  void initState() {
    AddEditTaskCubit addEditTaskCubit = context.read<AddEditTaskCubit>();
    if (widget.addEditTaskScreenArgs!.isEdit) {
      addEditTaskCubit.titleController.text =
          widget.addEditTaskScreenArgs!.taskTitle!;
      addEditTaskCubit.descriptionController.text =
          widget.addEditTaskScreenArgs!.taskDesc!;
      addEditTaskCubit.taskPririty = widget.addEditTaskScreenArgs!.priority!;
      addEditTaskCubit.taskStatus = addEditTaskCubit.taskStatus;
      addEditTaskCubit.taskImage = null;
    } else {
      addEditTaskCubit.clearData();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AddEditTaskCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task title',
            style: TextStyles.font12GrayRegular,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
            child: AppTextFormField(
                controller: context.read<AddEditTaskCubit>().titleController,
                hintText: 'Enter Title Here...',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter title';
                  }
                }),
          ),
          Text(
            'Task description',
            style: TextStyles.font12GrayRegular,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
            child: AppTextFormField(
                maxLines: 5,
                minLines: 5,
                controller:
                    context.read<AddEditTaskCubit>().descriptionController,
                hintText: 'Add description Here...',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter description';
                  }
                }),
          ),
          Text(
            'Priority',
            style: TextStyles.font12GrayRegular,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
            child: CustomEnumRowButton<Priority>(
              initialValue: PriorityExtension.fromApiValue(
                  context.read<AddEditTaskCubit>().taskPririty),
              values: Priority.values,
              displayName: (priority) => priority.displayName,
              apiValue: (priority) => priority.apiValue,
              containerColor: (priority) =>
                  getRightPriorityContainerColor(priority.apiValue),
              flagImage: (priority) => getRightFlagImage(priority.apiValue),
              textColor: (priority) =>
                  getRightPriorityTextColor(priority.apiValue),
              onValueSelected: (priority) {
                context.read<AddEditTaskCubit>().taskPririty =
                    priority.apiValue;
              },
            ),
          ),
          widget.addEditTaskScreenArgs!.isEdit
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status',
                      style: TextStyles.font12GrayRegular,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                      child: CustomEnumRowButton<Status>(
                        initialValue: StatusExtension.fromApiValue(
                            context.read<AddEditTaskCubit>().taskStatus),
                        values: Status.values,
                        displayName: (status) => status.displayName,
                        apiValue: (status) => status.apiValue,
                        containerColor: (status) =>
                            getRightStatusContainerColor(status.apiValue),
                        textColor: (status) =>
                            getRightStatusTextColor(status.apiValue),
                        onValueSelected: (status) {
                          context.read<AddEditTaskCubit>().taskStatus =
                              status.apiValue;
                        },
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          Text(
            'Due date',
            style: TextStyles.font12GrayRegular,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, bottom: 20.h),
            child: Stack(
              children: [
                AppTextFormField(
                    enabled: false,
                    controller:
                        context.read<AddEditTaskCubit>().dueDateController,
                    hintText: 'Choose due date',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter dueDate';
                      }
                    }),
                const Positioned(
                    right: 10, top: 10, child: DatePickerTextField()),
              ],
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: AddTaskButton(
                addEditTaskScreenArgs: widget.addEditTaskScreenArgs,
              )),
        ],
      ),
    );
  }
}
