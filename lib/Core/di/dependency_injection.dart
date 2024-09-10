import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky_app/Core/networking/api_service.dart';
import 'package:tasky_app/Core/networking/dio_factory.dart';
import 'package:tasky_app/features/add_task/data/models/add_edit_task_repo.dart';
import 'package:tasky_app/features/add_task/logic/add_edit_task_cubit.dart';
import 'package:tasky_app/features/home/data/repos/home_repo.dart';
import 'package:tasky_app/features/home/logic/home_cubit.dart';
import 'package:tasky_app/features/login/data/repos/login_repo.dart';
import 'package:tasky_app/features/login/logic/cubit/login_cubit.dart';
import 'package:tasky_app/features/profile/data/profile_repo.dart';
import 'package:tasky_app/features/profile/logic/profile_cubit.dart';
import 'package:tasky_app/features/task_details/data/task_details_repo.dart';
import '../../features/sign_up/data/repos/sign_up_repo.dart';
import '../../features/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));


  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerLazySingleton<SignupCubit>(() => SignupCubit(getIt()));


  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));



  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));

  getIt.registerLazySingleton<AddEditTaskCubit>(() => AddEditTaskCubit(getIt()));
  getIt.registerLazySingleton<AddEditTaskRepo>(() => AddEditTaskRepo(getIt()));

  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));



  getIt.registerLazySingleton<TaskDetailsRepo>(() => TaskDetailsRepo(getIt()));



}
