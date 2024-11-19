import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../posts/data/models/post_model.dart';
import '../models/profile_model.dart';
import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final SupabaseClient supabaseClient;

  ProfileRepoImpl({required this.supabaseClient});

  @override
  Future<ProfileModel> getProfile(String userId) async {
    final response = await supabaseClient.from('profiles').select().eq(
          'user_id',
          userId,
        );
    return response.map((e) => ProfileModel.fromMap(e)).single;
  }

  @override
  Future<List<ProfileModel>> getFollowers(String userId) async {
    final response = await supabaseClient
        .from('followers')
        .select()
        .eq('followed_id', userId);
        final followersIds = response.map((e) => e['follower_id']).toList();
        final followers = await supabaseClient.from('profiles').select().filter(
          'user_id',
          'in',
          followersIds,
        );
        Logger  ().d(followers);
    return followers.map((e) => ProfileModel.fromMap(e)).toList();
  }

  @override
  Future<List<ProfileModel>> getFollowing(String userId) async {
    final response = await supabaseClient
        .from('followers')
        .select()
        .eq('follower_id', userId);
    final following = await supabaseClient.from('profiles').select().eq('user_id', response.map((e) => e['followed_id']).toList());
    return following.map((e) => ProfileModel.fromMap(e)).toList();
  }

  @override
  Future<void> setFollow(String userId, String followingId) async {
    await supabaseClient.from('followers').insert({
      'followed_id': followingId,
      'follower_id': userId,
    });
    await supabaseClient.rpc('increment_follow', params: {
      'follower_id': userId,
      'followed_id': followingId,
    });
  }

  @override 
  Future<void> setUnfollow(String userId, String followingId) async {
 
  await supabaseClient.from('followers').delete().eq('follower_id', userId).eq('followed_id', followingId);
     await supabaseClient.rpc('decrement_follow', params: {
      'follower_id': userId,
      'followed_id': followingId,
  });
  }

  @override
  Future<bool> isFollowing(String userId, String followingId) async {
    final response = await supabaseClient
        .from('followers')
        .select()
        .eq('followed_id', followingId)
        .eq('follower_id', userId);
    return response.isNotEmpty;
  }

  @override
  Future<List<PostModel>> getPostsByUserId(String userId) async {
    final response = await supabaseClient
        .from('posts')
        .select()
        .eq('author_id', userId)
        .order('created_at', ascending: false);
    return response.map((e) => PostModel.fromMap(e)).toList();
  }
}
