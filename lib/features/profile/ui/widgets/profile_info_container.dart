import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/theming/colors.dart';
import 'package:tasky_app/Core/theming/styles.dart';

class ProfileInfoContainer extends StatelessWidget {
  const ProfileInfoContainer({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: ColorsManager.profileContainerGrey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.font12GrayMedium.copyWith(
                color: ColorsManager.profileContainerTitleColor,
              ),
            ),
            Text(
              value,
              style: TextStyles.font18DarkGreyBold,
            ),
          ],
        ),
      ),
    );
  }
}
