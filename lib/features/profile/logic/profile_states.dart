import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_states.freezed.dart';

@freezed
class ProfileStates<T> with _$ProfileStates<T> {
  const factory ProfileStates.initial() = _Initial;
  
  const factory ProfileStates.profileLoading() = ProfileLoading;
  const factory ProfileStates.profileSuccess(T data) = ProfileSuccess<T>;
  const factory ProfileStates.profileError({required String error}) = ProfileError;
}

