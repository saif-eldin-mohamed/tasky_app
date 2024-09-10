import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/theming/colors.dart';
import 'package:tasky_app/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final bool? enabled;
  final Widget? suffixIcon;
  final Widget? prefixWidget;
  final Color? backgroundColor;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final Function(String?) validator;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.prefixWidget,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.keyboardType,
    this.enabled,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        child: TextFormField(
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1, //minLines,
          enabled: enabled,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorsManager.mainColor,
                    width: 1.3,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorsManager.textFieldBorderGrey,
                    width: 1.3,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.textFieldBorderGrey,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefix: prefixWidget,
            fillColor: backgroundColor ?? Colors.white,
            filled: true,
          ),
          obscureText: isObscureText ?? false,
          style: TextStyles.font14DarkBlueMedium,
          validator: (value) {
            return validator(value);
          },
        ),
      ),
    );
  }
}

class CentralInputDecorations {
  static InputDecoration getInputDecoration({
    EdgeInsetsGeometry? contentPadding,
    InputBorder? focusedBorder,
    InputBorder? enabledBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    TextStyle? hintStyle,
    String? hintText,
    Widget? suffixIcon,
    Widget? prefixWidget,
    Color? backgroundColor,
  }) {
    return InputDecoration(
      isDense: true,
      contentPadding: contentPadding ??
          EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      focusedBorder: focusedBorder ??
          OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsManager.mainColor,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
      enabledBorder: enabledBorder ??
          OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsManager.textgrey,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
      errorBorder: errorBorder ??
          OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
      focusedErrorBorder: focusedErrorBorder ??
          OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
      hintText: hintText,
      suffixIcon: suffixIcon,
      prefix: prefixWidget,
      fillColor: backgroundColor ?? Colors.white,
      filled: true,
    );
  }
}
