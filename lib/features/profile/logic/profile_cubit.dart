import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_app/features/profile/data/profile_repo.dart';
import 'package:tasky_app/features/profile/logic/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(const ProfileStates.initial());

  emitProfileStates() async {


    emit(const ProfileStates.profileLoading());
    final response = await _profileRepo.getProfile();
    response.when(success: (profileResponse) {
   
      emit(ProfileStates.profileSuccess(profileResponse));
    }, failure: (error) {
      emit(
          ProfileStates.profileError(error: error.apiErrorModel.message ?? ''));
    });
  }
}
