import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/helpers/spacing.dart';
import 'package:tasky_app/Core/routing/app_router.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/Core/widgets/my_custom_chashed_networrk_image.dart';
import 'package:tasky_app/features/task_details/ui/widgets/color_changing_priority_container.dart';
import 'package:tasky_app/features/task_details/ui/widgets/color_changing_status_container.dart';
import 'package:tasky_app/features/task_details/ui/widgets/end_date_container.dart';
import 'package:tasky_app/features/task_details/ui/widgets/qr_code_widget.dart';
import 'package:tasky_app/features/task_details/ui/widgets/task_details_app_bar.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen(this.taskArgument, {super.key});
  final TaskDetailsScreenArgs taskArgument;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: _buildTaskScreenBody(taskArgument),
      ),
    );
  }

  SafeArea _buildTaskScreenBody(TaskDetailsScreenArgs taskArguments) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TaskDetailsAppBar(
              taskArgument: taskArguments,
            ),
            verticalSpace(10.h),
            LayoutBuilder(
              builder: (context, constrains) => Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: constrains.maxWidth > 1000 ? 300.w : 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyCustomCahedNetworkImage(
                      taskImage: taskArgument.taskImage,
                      height: 225.h,
                      width: constrains.maxWidth,
                      fit: BoxFit.cover,
                    ),
                    verticalSpace(16.h),
                    Text(
                      taskArgument.taskTitle,
                      style: TextStyles.font24BlackBold,
                    ),
                    verticalSpace(8.h),
                    Text(
                      taskArgument.taskDesc,
                      style: TextStyles.font12GrayMedium.copyWith(fontSize: 14),
                    ),
                    verticalSpace(16.h),
                    const EndDateContainer(),
                    verticalSpace(8.h),
                    ColorChanagingStatusContainer(status: taskArgument.status),
                    verticalSpace(8.h),
                    ColorChangingPriorityContainer(
                        priority: taskArgument.priority),
                    QRCodeWidget(taskId: taskArgument.id),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
