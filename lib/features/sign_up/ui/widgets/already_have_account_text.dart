import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, bottom: 15.h),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: TextStyles.font14GreyRegular,
            ),
            TextSpan(
              text: 'Sign in',
              style: TextStyles.font13BlueSemiBold.copyWith(
                  textBaseline: TextBaseline.alphabetic,
                  decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushReplacementNamed(Routes.loginScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}
