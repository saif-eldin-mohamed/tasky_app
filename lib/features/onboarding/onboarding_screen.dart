import 'package:flutter/material.dart';
import 'package:tasky_app/features/onboarding/widgets/app_desc_text.dart';
import 'package:tasky_app/features/onboarding/widgets/landing_image_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildLandingScreenBody(),
    );
  }
  
  Widget _buildLandingScreenBody() {
    return SafeArea(
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LandingImage(),
          ),
          Positioned(
            bottom: 75,
            left: 0,
            right: 0,
            child: const AppDescriptionTextAndStartButton(),
          ),
        ],
      ),
    );
  }
}
