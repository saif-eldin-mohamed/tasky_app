import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/Core/constatnts.dart';
import 'package:tasky_app/Core/helpers/utils_functions.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/Core/widgets/custom_app_bar.dart';
import 'package:tasky_app/features/profile/logic/profile_cubit.dart';
import 'package:tasky_app/features/profile/logic/profile_states.dart';
import 'package:tasky_app/features/profile/ui/widgets/profile_info_list.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>()..emitProfileStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomAppBar(
              screenTitle: AppConstants.profile,
            ),
            Expanded(
              child: BlocConsumer<ProfileCubit, ProfileStates>(
                listener: (context, state) {
                  if (state is ProfileError) {
                    setupErrorState(context, state.error);
                  }
                },
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return _buildLoading();
                  } else if (state is ProfileSuccess) {
                    return UserInformationListView(
                      userInformation: state.data,
                    );
                  } else {
                    return _buildEmptyState();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        'No profile data available',
        style: TextStyles.font16GreyRegular,
      ),
    );
  }
}
