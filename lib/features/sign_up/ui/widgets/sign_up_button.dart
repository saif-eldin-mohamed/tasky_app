import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/Core/widgets/app_text_button.dart';
import 'package:tasky_app/features/sign_up/logic/sign_up_cubit.dart';

class SignUPButton extends StatelessWidget {
  const SignUPButton({super.key});
  void _validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: AppTextButton(
        buttonText: "Sign Up",
        textStyle: TextStyles.font16WhiteSemiBold,
        onPressed: () {
          _validateThenDoSignup(context);
        },
      ),
    );
  }
}
