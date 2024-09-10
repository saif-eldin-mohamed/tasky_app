import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky_app/Core/assets_manager.dart';
import 'package:tasky_app/Core/helpers/spacing.dart';
import 'package:tasky_app/Core/theming/colors.dart';
import 'package:tasky_app/Core/theming/styles.dart';
import 'package:tasky_app/features/add_task/logic/add_edit_task_cubit.dart';

class AddImgButton extends StatelessWidget {
  const AddImgButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AddEditTaskCubit addEditTaskCubit = context.read<AddEditTaskCubit>();
    return Padding(
      padding: EdgeInsets.only(top: 30.h, bottom: 15.h),
      child: GestureDetector(
        onTap: () => _pickImage(ImageSource.gallery, context, addEditTaskCubit),
        child: DottedBorder(
          radius: const Radius.circular(10),
          color: ColorsManager.mainColor,
          borderType: BorderType.RRect,
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(IconsManager.addPhoto),
                horizontalSpace(10),
                Text(
                  'Add Img',
                  style: TextStyles.font19purplemedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _pickImage(ImageSource source, BuildContext context, dynamic addEditCubit) async {
  final ImagePicker picker = ImagePicker();

  // Function to handle image picking logic
  Future<void> pickImageFromSource(ImageSource source) async {
    try {
      final XFile? pickedImage = await picker.pickImage(source: source);
      if (pickedImage != null) {
        addEditCubit.taskImage = pickedImage;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You have picked an image: ${pickedImage.name}'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error picking image'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  // Show options to pick image from Camera or Files
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () async {
              await pickImageFromSource(ImageSource.camera);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Files'),
            onTap: () async {
              await pickImageFromSource(ImageSource.gallery);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}