import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/assets_manager.dart';
import 'package:tasky_app/Core/helpers/extensions.dart';
import 'package:tasky_app/Core/theming/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.screenTitle,
  });
  final String screenTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 22.w, right: 10.w),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: Image.asset(
              IconsManager.arrowLeftDark,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ),
        Text(
          screenTitle,
          style: TextStyles.font16BlackBold,
        ),
      ],
    );
  }
}
