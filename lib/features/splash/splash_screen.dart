import 'package:flutter/material.dart';
import 'package:tasky_app/Core/routing/routes.dart';
import 'package:tasky_app/Core/helpers/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تأخير مدة 3 ثواني قبل الانتقال إلى الصفحة المناسبة
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        isloggedInUser ? Routes.homeScreen : Routes.onBoardingScreen,
      ); // إذا كان المستخدم مسجل دخول
    });

    return Scaffold(
      backgroundColor: const Color(0xFF5F33E1),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              'assets/images/Splash.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
