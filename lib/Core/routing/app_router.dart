import 'package:flutter/material.dart';
import 'package:tasky_app/features/barcode_scan/barcode_scan_screen.dart';
import 'package:tasky_app/core/routing/routes.dart';
import 'package:tasky_app/features/add_task/ui/add_task_screen.dart';
import 'package:tasky_app/features/home/ui/home_screen.dart';
import 'package:tasky_app/features/login/ui/login_screen.dart';
import 'package:tasky_app/features/onboarding/onboarding_screen.dart';
import 'package:tasky_app/features/profile/ui/profile_screen.dart';
import 'package:tasky_app/features/splash/splash_screen.dart';
import 'package:tasky_app/features/task_details/ui/task_details_screen.dart';
import '../../features/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
        
      case Routes.addEditTodoScreen:
        final addEditTaskArgument = arguments as AddEditTaskScreenArgs;
        return MaterialPageRoute(
          builder: (_) => AddEditTaskScrreen(
            addEditTaskArgument,
          ),
        );
      case Routes.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case Routes.taskDetails:
        final taskArgument = arguments as TaskDetailsScreenArgs;
        return MaterialPageRoute(
          builder: (_) => TaskDetailsScreen(taskArgument),
        );
      case Routes.barcodeScanner:
        return MaterialPageRoute(
          builder: (_) => const BarcodeScanScreen(),
        );
         case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      
      default:
        return null;
    }
  }
}

//args_____________________
class TaskDetailsScreenArgs {
  final String taskImage;
  final String taskTitle;
  final String id;
  final String taskDesc;
  final String priority;
  final String status;

  TaskDetailsScreenArgs({
    required this.taskImage,
    required this.taskTitle,
    required this.id,
    required this.taskDesc,
    required this.priority,
    required this.status,
  });
}

class AddEditTaskScreenArgs {
  final String? taskImage;
  final String? taskTitle;
  final String? id;
  final String? taskDesc;
  final String? priority;
  final String? status;
  final bool isEdit;

  AddEditTaskScreenArgs(
      {this.taskImage,
      this.taskTitle,
      this.id,
      this.taskDesc,
      this.priority,
      this.status,
      required this.isEdit});
}
