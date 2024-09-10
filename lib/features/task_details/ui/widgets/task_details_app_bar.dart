import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/constatnts.dart';
import 'package:tasky_app/Core/helpers/spacing.dart';
import 'package:tasky_app/Core/routing/app_router.dart';
import 'package:tasky_app/Core/widgets/custom_app_bar.dart';
import 'package:tasky_app/features/task_details/ui/widgets/options_drop_down_button.dart';

class TaskDetailsAppBar extends StatelessWidget {
  const TaskDetailsAppBar({
    super.key,
    required this.taskArgument,
  });
  final TaskDetailsScreenArgs taskArgument;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomAppBar(screenTitle: AppConstants.taskDetails),
        const Spacer(),
        OptionsDropDownButton(
          taskArgument: taskArgument,
        ),
        horizontalSpace(9.w)
      ],
    );
  }
}
