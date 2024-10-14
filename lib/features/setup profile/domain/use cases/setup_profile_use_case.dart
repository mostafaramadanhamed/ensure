import 'dart:io';

import '../../data/repos/setup_profile_repo.dart';

class SetupProfileUseCase {
  final SetupProfileRepo setupProfileRepo;

  SetupProfileUseCase({required this.setupProfileRepo});

  Future<void> saveProfileInfo({required File profilePic}) async {
    await setupProfileRepo.saveProfileInfo( profilePic);
  }
}