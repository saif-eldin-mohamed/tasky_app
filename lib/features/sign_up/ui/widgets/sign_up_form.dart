import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/Core/helpers/app_regex.dart';
import 'package:tasky_app/Core/helpers/extensions.dart';
import 'package:tasky_app/Core/widgets/app_text_form_field.dart';
import 'package:tasky_app/features/sign_up/logic/sign_up_cubit.dart';
import 'package:tasky_app/features/sign_up/ui/widgets/experience_level_drop_down_button.dart';
import 'package:tasky_app/features/sign_up/ui/widgets/phone_text_field.dart';
import '../../../../core/helpers/spacing.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name...',
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalSpace(15),
          PhoneTextField(
            phoneController: context.read<SignupCubit>().phoneController,
            onChanged: (fullPhoneNumber) {
              context.read<SignupCubit>().fullPhoneNumberValue =
                  fullPhoneNumber;
            },
          ),
          AppTextFormField(
            keyboardType: TextInputType.number,
            hintText: 'Years of experience',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidYearsOfExperience(value)) {
                return 'Enter Valid Number';
              }
            },
            controller: context.read<SignupCubit>().yearsOfExperinceController,
          ),
          verticalSpace(15),
          ExperienceLevelDropButton(
            experiencelevelController:
                context.read<SignupCubit>().experienceLevelController,
          ),
          verticalSpace(15),
          AppTextFormField(
            controller: context.read<SignupCubit>().addressController,
            hintText: 'Address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter address';
              }
            },
          ),
          verticalSpace(15),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              if (value.length < 8) {
                return 'Passowrd length must be more than 8 characters';
              }
            },
          ),
          verticalSpace(24),
        ],
      ),
    );
  }
}
