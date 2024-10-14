import 'dart:io';

import 'package:ensure/core/network/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'setup_profile_repo.dart';

class SetupProfileRepoImpl implements SetupProfileRepo {
  final SupabaseClient supabase;

  SetupProfileRepoImpl({required this.supabase});
  @override
  Future<void> saveProfileInfo(
  File    profilePic) async {
    try {
      await supabase.storage.from(SupabaseConstants.profileBucket).upload(
          supabase.auth.currentUser!.id, profilePic);

     
    } catch (e) {
      throw Exception(e);
    }
  }
}
