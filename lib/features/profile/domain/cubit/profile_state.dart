import '../../../posts/data/models/post_model.dart';
import '../../data/models/profile_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileModel profile;
  ProfileSuccess({required this.profile});
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}

// Post-related states
class ProfilePostsLoading extends ProfileState {}

class ProfilePostsSuccess extends ProfileState {
  final List<PostModel> posts;
  ProfilePostsSuccess({required this.posts});
}

class ProfilePostsError extends ProfileState {
  final String message;
  ProfilePostsError(this.message);
}

// set follow state
class ProfileSetFollowSuccess extends ProfileState {
  final bool isFollowing;
  ProfileSetFollowSuccess({this.isFollowing=false});
}

class ProfileSetFollowError extends ProfileState {
  final String message;
  ProfileSetFollowError(this.message);
}