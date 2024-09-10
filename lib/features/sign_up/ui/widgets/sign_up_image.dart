import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/assets_manager.dart';

class SignUpImage extends StatelessWidget {
  const SignUpImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesManager.landingImage,
      width: 482.w,
      height: 375.h,
      fit: BoxFit.contain,
    );
  }
}
