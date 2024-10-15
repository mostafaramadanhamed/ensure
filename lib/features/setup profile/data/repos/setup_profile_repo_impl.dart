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
          'ProfilePictures/${supabase.auth.currentUser!.id}', profilePic,
          fileOptions: const FileOptions(upsert: true));

     
    } catch (e) {
      throw Exception(e);
    }
  }
}
