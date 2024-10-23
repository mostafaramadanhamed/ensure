import '../../data/models/profile_model.dart';
import '../../data/repo/profile_repo.dart';

class ProfileUseCase {
  final ProfileRepo profileRepo;

  ProfileUseCase({required this.profileRepo});

  Future<ProfileModel> getProfile(String userId) async {
    return await profileRepo.getProfile(userId);
  }
}