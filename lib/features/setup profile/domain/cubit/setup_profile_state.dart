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
