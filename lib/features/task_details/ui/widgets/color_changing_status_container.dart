import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/helpers/utils_functions.dart';
import 'package:tasky_app/Core/theming/styles.dart';

class ColorChanagingStatusContainer extends StatelessWidget {
  const ColorChanagingStatusContainer({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.r),
          color: getRightStatusContainerColor(status)),
      child: Row(
        children: [
          Text(status,
              style: TextStyles.font16GreyBold
                  .copyWith(color: getRightStatusTextColor(status))),
        ],
      ),
    );
  }
}
