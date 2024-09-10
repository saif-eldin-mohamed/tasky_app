import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/Core/assets_manager.dart';
import 'package:tasky_app/Core/helpers/extensions.dart';
import 'package:tasky_app/Core/routing/app_router.dart';
import 'package:tasky_app/Core/routing/routes.dart';
import 'package:tasky_app/Core/theming/colors.dart';
import 'package:tasky_app/features/add_task/logic/add_edit_task_cubit.dart';

class AddTaskFloatingActionButton extends StatelessWidget {
  const AddTaskFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      width: 65.w,
      child: FloatingActionButton(
        heroTag: 'fab2',
        onPressed: () {
          context.read<AddEditTaskCubit>().isEdit = false;
          context.pushNamed(Routes.addEditTodoScreen,
              arguments: AddEditTaskScreenArgs(isEdit: false));
        },
        backgroundColor: ColorsManager.mainColor,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          size: 30.h,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BarcodeFloatingActionButton extends StatelessWidget {
  const BarcodeFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 50.w,
      child: FloatingActionButton(
        heroTag: 'fab1',
        onPressed: () {
          Navigator.pushNamed(context, Routes.barcodeScanner);
        },
        backgroundColor: ColorsManager.barcodeFABColor,
        shape: const CircleBorder(),
        child: SizedBox(
            height: 20.h,
            width: 20.w,
            child: SvgPicture.asset(IconsManager.barCodeIcon)),
      ),
    );
  }
}
