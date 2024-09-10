import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasky_app/Core/assets_manager.dart';
import 'package:tasky_app/Core/helpers/extensions.dart';
import 'package:tasky_app/Core/theming/colors.dart';
import 'package:tasky_app/Core/theming/styles.dart';

void setupErrorState(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: TextStyles.font15DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: TextStyles.font14BlueSemiBold,
          ),
        ),
      ],
    ),
  );
}

String getRightFlagImage(String priority) {
  switch (priority) {
    case 'low':
      return IconsManager.blueFlagIcon;
    case 'high':
      return IconsManager.redFlagIcon;
    case 'medium':
      return IconsManager.purpleFlagIcon;
    default:
      return '';
  }
}

Color getRightPriorityTextColor(String priority) {
  switch (priority) {
    case 'low':
      return ColorsManager.textBlue;
    case 'high':
      return ColorsManager.textRed;
    case 'medium':
      return ColorsManager.mainColor;
    default:
      return Colors.white;
  }
}

Color getRightStatusContainerColor(String priority) {
  switch (priority) {
    case 'waiting':
      return ColorsManager.containerRed;
    case 'inProgress':
      return ColorsManager.containerMain;
    case 'finished':
      return ColorsManager.containerBlue;
    default:
      return Colors.white;
  }
}

Color getRightPriorityContainerColor(String priority) {
  switch (priority) {
    case 'high':
      return ColorsManager.containerRed;
    case 'low':
      return ColorsManager.containerBlue;
    case 'medium':
      return ColorsManager.containerMain;
    default:
      return Colors.white;
  }
}

Color getRightStatusTextColor(String priority) {
  switch (priority) {
    case 'waiting':
      return ColorsManager.textRed;
    case 'inProgress':
      return ColorsManager.mainColor;
    case 'finished':
      return ColorsManager.textBlue;
    default:
      return Colors.white;
  }
}

String convertTimestampToDate(String timestamp) {
  try {
    DateTime dateTime = DateTime.parse(timestamp);

    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    String formattedDate = dateFormat.format(dateTime);

    return formattedDate;
  } catch (e) {
    if (kDebugMode) {
      print('Error parsing date: $e');
    }
    return '';
  }
}

  ScrollBehavior buildScrollBehavior(BuildContext context) {
    return ScrollConfiguration.of(context).copyWith(
      dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },
    );
  }
  String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}