import 'package:ensure/features/posts/data/models/post_model.dart';

import '../../data/models/profile_model.dart';
import '../../data/repo/profile_repo.dart';

class ProfileUseCase {
  final ProfileRepo profileRepo;

  ProfileUseCase({required this.profileRepo});

  Future<ProfileModel> getProfile(String userId) async {
    return await profileRepo.getProfile(userId);
  }

  Future<List<PostModel>> getPostsByUserId(String userId) async {
    return await profileRepo.getPostsByUserId(userId);
  }

  Future<void> setFollow(String userId, String followingId) async {
    return await profileRepo.setFollow(userId, followingId);
  }

  Future<bool> isFollowing(String userId, String followingId) async {
    return await profileRepo.isFollowing(userId, followingId);
  }

  Future<void> setUnfollow(String userId, String followingId) async {
    return await profileRepo.setUnfollow(userId, followingId);
  }
}