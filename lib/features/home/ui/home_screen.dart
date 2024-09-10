import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/constatnts.dart';
import 'package:tasky_app/Core/helpers/utils_functions.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/core/helpers/spacing.dart';
import 'package:tasky_app/features/home/logic/home_cubit.dart';
import 'package:tasky_app/features/home/ui/widgets/categories_list_widget.dart';
import 'package:tasky_app/features/home/ui/widgets/home_floating_action_buttons.dart';
import 'package:tasky_app/features/home/ui/widgets/home_screen_app_bar.dart';
import 'package:tasky_app/features/home/ui/widgets/home_screen_bloc_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    context.read<HomeCubit>().getTasksForFirstTime();
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {

    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    if (currentScroll >= maxScroll) {
      context.read<HomeCubit>().loadMoreItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return Scaffold(
      body: _buildHomeScreenBody(homeCubit, context),
      floatingActionButton: _buildFloatingActionButtons(),
    );
  }

//floating action button
  Widget _buildFloatingActionButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Platform.isWindows
            ? const SizedBox()
            : const BarcodeFloatingActionButton(),
        verticalSpace(14.h),
        const AddTaskFloatingActionButton(),
      ],
    );
  }

//body
  SafeArea _buildHomeScreenBody(HomeCubit homeCubit, BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          await homeCubit.getTasksForFirstTime();
        },
        child: ScrollConfiguration(
          behavior: buildScrollBehavior(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeScreenAppBar(mounted: mounted),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: constraints.maxWidth >= 1000 ? 300.w : 0,
                        ),
                        child: _buildCategryBarAndTasksList(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//maincontent
  Widget _buildCategryBarAndTasksList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
          child: Text(
            AppConstants.myTasks,
            style: TextStyles.font16GreyBold,
          ),
        ),
        const CategoriesListWidget(),
        verticalSpace(30),
        Expanded(
          child: HomeScreenBlocBuilder(scrollController: _scrollController),
        ),
      ],
    );
  }
}
