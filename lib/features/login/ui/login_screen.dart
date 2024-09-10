import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/features/login/logic/cubit/login_cubit.dart';
import 'package:tasky_app/features/onboarding/widgets/landing_image_widget.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import 'widgets/dont_have_account_text.dart';
import 'widgets/phone_and_password.dart';
import 'widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isLargeScreen = constraints.maxWidth > 1000;

              return Stack(
                children: [
                  const Positioned(
                      top: 0, left: 0, right: 0, child: LandingImage()),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: isLargeScreen ? 300 : 30, vertical: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.44),
                        Text(
                          'Login',
                          style: TextStyles.font24BlackBold,
                        ),
                        verticalSpace(20),
                        Column(
                          children: [
                            const PhoneAndPassword(),
                            AppTextButton(
                              buttonText: "Sign In",
                              textStyle: TextStyles.font16WhiteSemiBold,
                              onPressed: () {
                                validateThenDoLogin(context);
                              },
                            ),
                            verticalSpace(24),
                            const DontHaveAccountText(),
                            const LoginBlocListener(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
