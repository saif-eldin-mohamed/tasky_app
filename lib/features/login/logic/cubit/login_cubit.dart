import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/Core/helpers/constants.dart';
import 'package:tasky_app/Core/helpers/shared_pref_helper.dart';
import 'package:tasky_app/Core/networking/dio_factory.dart';
import 'package:tasky_app/features/login/data/models/login_request_body.dart';
import 'package:tasky_app/features/login/data/repos/login_repo.dart';
import 'package:tasky_app/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? fullPhoneNumberValue;
  final formKey = GlobalKey<FormState>();

  void _disposeControllers() {
    phoneController.clear();
    passwordController.clear();
  }

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        phone: fullPhoneNumberValue!,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) async {
    

      await saveUserAcessToken(loginResponse.accessToken ?? '');
      await saveUserRefreshToken(loginResponse.refreshToken ?? '');
      await saveUserId(loginResponse.id ?? '');

      emit(LoginState.success(loginResponse));
      _disposeControllers();
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
        
    });
  }

  Future<void> saveUserAcessToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.accessToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  Future<void> saveUserRefreshToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.refreshToken, token);
  }

  Future<void> saveUserId(String userId) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userId, userId);
  }
}
