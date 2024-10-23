
import 'package:ensure/features/profile/domain/use%20case/profile_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase profileUseCase;
  ProfileCubit(this.profileUseCase) : super(ProfileInitial());

  Future<void> getProfile(String userId) async {
    emit(ProfileLoading());
    try {
      final profile = await profileUseCase.getProfile(userId);
      emit(ProfileSuccess(profile: profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
