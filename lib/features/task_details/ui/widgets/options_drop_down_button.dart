import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/helpers/extensions.dart';
import 'package:tasky_app/Core/routing/app_router.dart';
import 'package:tasky_app/Core/routing/routes.dart';
import 'package:tasky_app/Core/theming/colors.dart';
import 'package:tasky_app/Core/theming/font_weight_helper.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/features/add_task/logic/add_edit_task_cubit.dart';
import 'package:tasky_app/features/home/logic/home_cubit.dart';

class OptionsDropDownButton extends StatefulWidget {
  const OptionsDropDownButton({
    super.key,
    required this.taskArgument,
  });
  final TaskDetailsScreenArgs taskArgument;
  @override
  OptionsDropDownButtonState createState() => OptionsDropDownButtonState();
}

class OptionsDropDownButtonState extends State<OptionsDropDownButton> {
  final GlobalKey _menuKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  OptionsDropDownButtonState();
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: ColorsManager.textBlack,
      iconSize: 25.h,
      key: _menuKey,
      icon: const Icon(Icons.more_vert),
      onPressed: () =>
          _showCustomMenu(_overlayEntry, context, widget.taskArgument),
    );
  }
}

void _showCustomMenu(overlayEntry, context, TaskDetailsScreenArgs task) {
  if (overlayEntry != null) {
    overlayEntry!.remove();
    overlayEntry = null;
  } else {
    overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          overlayEntry!.remove();
          overlayEntry = null;
        },
        child: SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  right: 10.w,
                  top: 40.h,
                  width: 90.w,
                  child: GestureDetector(
                    onTap: () {},
                    child: Material(
                      color: Colors.transparent,
                      child: CustomPaint(
                        painter: CustomShapePainter(),
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  context.read<AddEditTaskCubit>().isEdit =
                                      true;
                                  overlayEntry?.remove();
                                  context.pushReplacementNamed(
                                      Routes.addEditTodoScreen,
                                      arguments: AddEditTaskScreenArgs(
                                          isEdit: true,
                                          id: task.id,
                                          priority: task.priority,
                                          status: task.status,
                                          taskDesc: task.taskDesc,
                                          taskImage: task.taskImage,
                                          taskTitle: task.taskTitle));
                                },
                                child: SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      'Edit',
                                      style: TextStyles.font16BlackBold
                                          .copyWith(
                                              fontWeight:
                                                  FontWeightHelper.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(
                                endIndent: 10,
                                indent: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  context.read<HomeCubit>().deleteTaskById(
                                        task.id,
                                      );
                                  overlayEntry!.remove();
                                  context.pop();
                                },
                                child: SizedBox(
                                  height: 40,
                                  child: Text(
                                    'Delete',
                                    style: TextStyles.font16BlackBold.copyWith(
                                        fontWeight: FontWeightHelper.bold,
                                        color: ColorsManager.textLightRed),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final path = Path();

    path.moveTo(size.width * 0.5 + (12.w), 0);
    path.lineTo(size.width * 0.5 + (20.w), -7.h);
    path.lineTo(size.width * 0.5 + (28.w), 0);
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height), Radius.circular(15.r)));

    canvas.drawShadow(path, Colors.black, 7, false);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
