
import 'dart:io';

abstract class SetupProfileRepo {
  Future<void> saveProfileInfo( File profilePic);
}