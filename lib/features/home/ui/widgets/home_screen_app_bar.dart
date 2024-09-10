import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/Core/assets_manager.dart';
import 'package:tasky_app/Core/constatnts.dart';
import 'package:tasky_app/Core/helpers/extensions.dart';
import 'package:tasky_app/Core/helpers/shared_pref_helper.dart';
import 'package:tasky_app/Core/helpers/spacing.dart';
import 'package:tasky_app/Core/routing/routes.dart';
import 'package:tasky_app/Core/theming/styles.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
    required this.mounted,
  });

  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AppConstants.logo,
          style: TextStyles.font24BlackBold,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.profile);
          },
          child: SvgPicture.asset(
            IconsManager.profileIcon,
            height: 24.h,
            width: 24.w,
          ),
        ),
        horizontalSpace(20),
        GestureDetector(
            onTap: () async {
              await SharedPrefHelper.clearAllSecuredData();

              if (mounted) {
                context.pushNamedAndRemoveUntil(
                  Routes.loginScreen,
                  predicate: (Route<dynamic> route) {
                    return false;
                  },
                );
              }
            },
            child: SvgPicture.asset(
              IconsManager.exitIcon,
              height: 24.h,
              width: 24.w,
            )),
        horizontalSpace(22),
      ],
    );
  }
}
