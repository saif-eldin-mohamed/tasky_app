import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/Core/assets_manager.dart';
import 'package:tasky_app/features/profile/data/profile_response.dart';
import 'package:tasky_app/features/profile/logic/profile_cubit.dart';
import 'package:tasky_app/features/profile/ui/widgets/profile_info_container.dart';

class UserInformationListView extends StatelessWidget {
  const UserInformationListView({
    super.key,
    required this.userInformation,
  });

  final ProfileResponse userInformation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        bool isLargeScreen = constraints.maxWidth > 1000;
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isLargeScreen ? 300 : 20, vertical: 36.h),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              ProfileInfoContainer(
                title: 'NAME',
                value: userInformation.displayName ?? 'N/A',
              ),
              Stack(
                children: [
                  ProfileInfoContainer(
                    title: 'Phone',
                    value: userInformation.phoneNumber ?? 'N/A',
                  ),
                  Positioned(
                    right: 10,
                    bottom: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: () => _copyPhoneNumber(
                          userInformation.phoneNumber, context),
                      child: SvgPicture.asset(IconsManager.copy),
                    ),
                  )
                ],
              ),
              ProfileInfoContainer(
                title: 'Level',
                value: userInformation.level ?? 'N/A',
              ),
              ProfileInfoContainer(
                title: 'YEARS OF EXPERIENCE',
                value: '${userInformation.experienceYears}',
              ),
              ProfileInfoContainer(
                title: 'Location',
                value: userInformation.address ?? 'N/A',
              ),
            ],
          ),
        );
      },
    );
  }
}

void _copyPhoneNumber(phoneNumber, context) async {
  await Clipboard.setData(ClipboardData(text: phoneNumber));
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text("Phone copied to Clipboard"),
  ));
}
