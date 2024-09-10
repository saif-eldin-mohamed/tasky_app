import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/constatnts.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:tasky_app/features/sign_up/ui/widgets/sign_up_button.dart';
import 'package:tasky_app/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:tasky_app/features/sign_up/ui/widgets/sign_up_image.dart';

import 'widgets/already_have_account_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            bool isLargeScreen = constraints.maxWidth > 1000;
            return Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: isLargeScreen ? 300 : 0),
              child: Stack(
                children: [
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SignUpImage(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.28),
                      Padding(
                        padding: EdgeInsets.only(bottom: 24.h, left: 25.w),
                        child: Text(
                          AppConstants.signUp,
                          style: TextStyles.font24BlackBold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SignupForm(),
                            SignUPButton(),
                            AlreadyHaveAccountText(),
                            SignupBlocListener(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
