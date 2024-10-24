import 'package:ensure/features/profile/data/models/profile_model.dart';

import '../../../posts/data/models/post_model.dart';

abstract class ProfileRepo {
  Future<ProfileModel> getProfile(String userId);
  
  // follower and following
  Future<List<Map<String, dynamic>>> getFollowers();
  Future<List<Map<String, dynamic>>> getFollowing();
  // set following
  Future<void> setFollowing(int userId);
  Future<void> setFollower(int userId);
  
  // get post by user id
  Future<List<PostModel>> getPostsByUserId(int userId);
 
}