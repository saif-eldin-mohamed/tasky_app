import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/Core/helpers/constants.dart';
import 'package:tasky_app/Core/helpers/shared_pref_helper.dart';
import 'package:tasky_app/Core/networking/dio_factory.dart';

import 'package:tasky_app/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:tasky_app/features/sign_up/logic/sign_up_state.dart';

import '../data/models/sign_up_request_body.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController yearsOfExperinceController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController experienceLevelController = TextEditingController();
  String? fullPhoneNumberValue;
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void _disposeControllers() {
    phoneController.clear();
    passwordController.clear();
    experienceLevelController.clear();
    addressController.clear();
    yearsOfExperinceController.clear();
    nameController.clear();
  }

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        phone: fullPhoneNumberValue!,
        password: passwordController.text,
        displayName: nameController.text,
        experienceYears: int.parse(yearsOfExperinceController.text),
        level: experienceLevelController.text,
        address: addressController.text,
      ),
    );
    response.when(success: (signupResponse) async {
    
      await saveUserAcessToken(signupResponse.accessToken ?? '');
      await saveUserRefreshToken(signupResponse.refreshToken ?? '');
      await saveUserId(signupResponse.id!);
        _disposeControllers();
      emit(SignupState.signupSuccess(signupResponse));
    }, failure: (error) {
      emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
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
