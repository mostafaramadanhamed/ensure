import 'package:supabase_flutter/supabase_flutter.dart';

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
  Future<void> setFollower(int userId) async {
    await supabaseClient.from('followers').insert({
      'user_id': supabaseClient.auth.currentUser!.id,
      'following_id': userId
    });
  }

  @override
  Future<void> setFollowing(int userId) async {
    await supabaseClient.from('following').insert({
      'user_id': supabaseClient.auth.currentUser!.id,
      'following_id': userId
    });
  }
}
