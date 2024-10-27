import 'dart:io';

import 'package:ensure/core/network/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'setup_profile_repo.dart';

class SetupProfileRepoImpl implements SetupProfileRepo {
  final SupabaseClient supabase;

  SetupProfileRepoImpl({required this.supabase});
  @override
  Future<void> saveProfileInfo(File profilePic) async {
    try {
      await supabase.storage.from(SupabaseConstants.profileBucket).upload(
          'ProfilePictures/${supabase.auth.currentUser!.id}', profilePic,
          fileOptions: const FileOptions(upsert: true));
    } catch (e) {
      throw Exception(e);
    }
  }

  // get profile pic

  String getProfilePic() {
    try {
      final response = supabase.storage
          .from(SupabaseConstants.profileBucket)
          .getPublicUrl('ProfilePictures/${supabase.auth.currentUser!.id}');
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // update profile pic
  @override
  Future<void> setProfilePic() async {
    try {
      await supabase.auth
          .updateUser(UserAttributes(data: {'profile_pic': getProfilePic()}));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> setProfile() async {
    try {
      await supabase.from('profiles').insert({
        'user_id': supabase.auth.currentUser!.id,
        'name': supabase.auth.currentUser!.userMetadata!['Display name'],
        'bio': supabase.auth.currentUser!.userMetadata!['bio'],
        'profile_pic': supabase.auth.currentUser!.userMetadata!['profile_pic'],
        'following_count': 0,
        'followers_count': 0,
      });
     
    } catch (e) {
      throw Exception(e);
    }
  }
}
