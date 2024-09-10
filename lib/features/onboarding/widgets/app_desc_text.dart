import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/constatnts.dart';
import 'package:tasky_app/Core/helpers/spacing.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/features/onboarding/widgets/get_started_button.dart';

class AppDescriptionTextAndStartButton extends StatelessWidget {
  const AppDescriptionTextAndStartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              SizedBox(
                width: 235.w,
                child: Text(
                  AppConstants.taskManagementTitle,
                  style: TextStyles.font24BlackBold,
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace(16),
              SizedBox(
                width: screenWidth * .8,
                child: Text(
                  AppConstants.taskManagementDescription,
                  style: TextStyles.font14GreyRegular
                      .copyWith(height: 1.8, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  textHeightBehavior:
                      const TextHeightBehavior(applyHeightToLastDescent: true),
                ),
              ),
              verticalSpace(20),
              const GetStartedButton(),
            ],
          ),
        )
      ],
    );
  }
}
