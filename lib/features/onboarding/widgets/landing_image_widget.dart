import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tasky_app/Core/assets_manager.dart';

class LandingImage extends StatelessWidget {
  const LandingImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Image.asset(
      ImagesManager.landingImage,
      height: screenheight * .64,
      width: double.infinity,
      fit: Platform.isWindows ? BoxFit.contain : BoxFit.cover,
    );
  }
}
