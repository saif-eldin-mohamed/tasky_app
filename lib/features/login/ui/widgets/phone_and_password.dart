import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/features/login/logic/cubit/login_cubit.dart';
import 'package:tasky_app/features/sign_up/ui/widgets/phone_text_field.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class PhoneAndPassword extends StatefulWidget {
  const PhoneAndPassword({super.key});

  @override
  State<PhoneAndPassword> createState() => _PhoneAndPasswordState();
}

class _PhoneAndPasswordState extends State<PhoneAndPassword> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          PhoneTextField(
            phoneController: context.read<LoginCubit>().phoneController,
            onChanged: (fullPhoneNumber) {
              context.read<LoginCubit>().fullPhoneNumberValue = fullPhoneNumber;
            },
          ),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(18),
        ],
      ),
    );
  }
}
