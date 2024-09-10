import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tasky_app/Core/networking/api_constants.dart';

class MyCustomCahedNetworkImage extends StatelessWidget {
  const MyCustomCahedNetworkImage({
    super.key,
    required this.taskImage,
    required this.height,
    required this.width,
    required this.fit,
  });

  final String taskImage;
  final double height;
  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      errorWidget: (context, string, s) => Image.asset(
        'assets/images/splash_android_12.png',
      ),
      imageUrl: '${ApiConstants.apiBaseUrl}images/$taskImage',
      
      height: height,
      placeholder: (context, string) => Image.asset(
        'assets/images/splash_android_12.png',
      ),
      width: width,
      fit: fit,
    );
  }
}