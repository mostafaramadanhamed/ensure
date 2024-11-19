import 'package:ensure/features/profile/data/models/profile_model.dart';

import '../../../posts/data/models/post_model.dart';

abstract class ProfileRepo {
  Future<ProfileModel> getProfile(String userId);
  
  // follower and following
  Future<List<ProfileModel>> getFollowers(String userId);
  Future<List<ProfileModel>> getFollowing(String userId);
  // set following
  Future<void> setFollow(String userId, String followingId);
  Future<void> setUnfollow(String userId, String followingId);
 // Future<void> setFollower(int userId);
  
  // get post by user id
  Future<List<PostModel>> getPostsByUserId(String userId);
 
 // is following
  Future<bool> isFollowing(String userId, String followingId);
}