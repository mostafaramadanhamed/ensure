import '../../data/models/profile_model.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final ProfileModel profile;

  ProfileSuccess({required this.profile});
}

final class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
