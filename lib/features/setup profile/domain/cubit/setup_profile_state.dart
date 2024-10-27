part of 'setup_profile_cubit.dart';

abstract class SetupProfileState {}

class SetupProfileInitial extends SetupProfileState {}

class SetupProfileLoading extends SetupProfileState {}

class SetupProfileSuccess extends SetupProfileState {}

class SelectPhotoSuccess extends SetupProfileState {}


class SetupProfileError extends SetupProfileState {
  final String message;
  SetupProfileError(this.message);
}

// set profile

class SetProfilePicSuccess extends SetupProfileState {}

class SetProfilePicError extends SetupProfileState {
  final String message;
  SetProfilePicError(this.message);
}