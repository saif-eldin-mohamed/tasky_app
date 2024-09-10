import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasky_app/Core/constatnts.dart';
import 'package:tasky_app/Core/helpers/enums.dart';
import 'package:tasky_app/Core/helpers/extensions.dart';
import 'package:tasky_app/Core/theming/colors.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/Core/widgets/custom_input_decoration.dart';

class ExperienceLevelDropButton extends StatelessWidget {
  const ExperienceLevelDropButton(
      {super.key, required this.experiencelevelController});
  final TextEditingController experiencelevelController;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        isDense: true,
        validator: (value) {
          if (value.isNullOrEmpty()) {
            return 'Please choose experience level';
          }
        },
        hint: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Choose experience Level',
            style: TextStyles.font14LightGrayRegular.copyWith(
                color: ColorsManager.textBlack, fontWeight: FontWeight.w600),
          ),
        ),
        decoration: customInputDecoration(AppConstants.chooseExperienceLevel),
        icon: Icon(
          MdiIcons.chevronDown,
          color: ColorsManager.textFieldBorderGrey,
          size: 30,
        ),
        items: getDropdownItems(),
        onChanged: (value) {
          experiencelevelController.text = experienceLevelMapping[value]!;
        },
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    return experienceLevelsDisplay.map((String level) {
      return DropdownMenuItem<String>(
        value: level,
        child: Text(level),
      );
    }).toList();
  }
}
