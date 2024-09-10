import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_app/Core/assets_manager.dart';
import 'package:tasky_app/Core/helpers/utils_functions.dart';
import 'package:tasky_app/features/add_task/logic/add_edit_task_cubit.dart';

class DatePickerTextField extends StatelessWidget {
  const DatePickerTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2080))
            .then((value) {
          var formatedDate = convertTimestampToDate(value.toString());
          context.read<AddEditTaskCubit>().dueDateController.text =
              formatedDate;
        });
      },
      child: SvgPicture.asset(
        IconsManager.calendar,
        height: 30.h,
        width: 30.w,
      ),
    );
  }
}
