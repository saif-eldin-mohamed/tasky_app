import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/Core/helpers/spacing.dart';
import 'package:tasky_app/Core/helpers/utils_functions.dart';
import 'package:tasky_app/Core/theming/styles.dart';

class ColorChangingPriorityContainer extends StatelessWidget {
  const ColorChangingPriorityContainer({
    super.key,
    required this.priority,
  });

  final String priority;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.r),
          color: getRightPriorityContainerColor(priority)),
      child: Row(
        children: [
          SvgPicture.asset(
            getRightFlagImage(priority),
            height: 30,
            width: 30,
          ),
          horizontalSpace(20),
          Text('$priority Priority',
              style: TextStyles.font16GreyBold
                  .copyWith(color: getRightPriorityTextColor(priority))),
        ],
      ),
    );
  }
}
