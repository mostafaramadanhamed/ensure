
import 'dart:io';


abstract class SetupProfileRepo {
  Future<void> saveProfileInfo( File profilePic);

  Future<void> setProfilePic();

  Future<void>setProfile();
}