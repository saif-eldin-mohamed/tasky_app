import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_app/Core/theming/colors.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/features/home/logic/home_cubit.dart';
import 'package:tasky_app/features/home/logic/home_states.dart';

class CategoriesListWidget extends StatefulWidget {
  const CategoriesListWidget({
    super.key,
  });

  @override
  State<CategoriesListWidget> createState() => CategoriesListWidgetState();
}

class CategoriesListWidgetState extends State<CategoriesListWidget> {
  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();
    return SizedBox(
      height: 36.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeCubit.categoriesList.length,
          itemBuilder: (context, index) {
            String categoryItem = homeCubit.categoriesList[index];
            return GestureDetector(
              onTap: () {
                context
                    .read<HomeCubit>()
                    .changeTaskStatusCategory(homeCubit.categoriesList[index]);
              },
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: homeCubit.selectedIndex == index
                          ? ColorsManager.mainColor
                          : ColorsManager.containerGrey,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: Text(
                        categoryItem,
                        style: TextStyles.font16GreyRegular.copyWith(
                          color: homeCubit.selectedIndex == index
                              ? Colors.white
                              : ColorsManager.textgrey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
