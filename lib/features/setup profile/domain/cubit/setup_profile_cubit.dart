import 'dart:io';

import 'package:ensure/features/setup%20profile/domain/use%20cases/setup_profile_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/methods.dart';

part 'setup_profile_state.dart';

class SetupProfileCubit extends Cubit<SetupProfileState> {
  final SetupProfileUseCase setupProfileUseCase;
  SetupProfileCubit(this.setupProfileUseCase) : super(SetupProfileInitial());
  File? image;
  Future<void> saveProfileInfo({required File profilePic}) async {
    emit(SetupProfileLoading());
    try {
      await setupProfileUseCase.saveProfileInfo(profilePic: profilePic);
      await setupProfileUseCase.setProfilePic();
      emit(SetupProfileSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(SetupProfileError(e.toString()));
    }
  }

  void selectImage(context) async {
    image = await pickImageFromGallery(context);
    if (image != null) {
      emit(SelectPhotoSuccess());
      await saveProfileInfo(profilePic: image!);
    }
  }

  Future<void> setProfile() async {
    emit(SetupProfileLoading());
    try {
      await setupProfileUseCase.setProfile();
      emit(SetupProfileSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(SetupProfileError(e.toString()));
    }
  }
}
