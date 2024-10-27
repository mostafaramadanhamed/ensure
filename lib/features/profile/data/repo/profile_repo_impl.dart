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
  Future<List<Map<String, dynamic>>> getFollowers() async {
    final response = await supabaseClient
        .from('followers')
        .select()
        .eq('user_id', supabaseClient.auth.currentUser!.id);
    return response;
  }

  @override
  Future<List<Map<String, dynamic>>> getFollowing() async {
    final response = await supabaseClient
        .from('following')
        .select()
        .eq('user_id', supabaseClient.auth.currentUser!.id);
    return response;
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
