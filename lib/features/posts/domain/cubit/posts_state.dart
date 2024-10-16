 import '../../data/models/post_model.dart';

abstract class PostsState {}

final class PostsInitial extends PostsState {}

// add posts states
final class AddPostLoading extends PostsState {}

final class AddPostSuccess extends PostsState {}

final class AddPostError extends PostsState {

  final String message;

  AddPostError(this.message);
}

// get posts states

final class GetPostsLoading extends PostsState {}
final class GetPostsEmpty extends PostsState {}

final class GetPostsSuccess extends PostsState {

  final List<PostModel> posts;

  GetPostsSuccess({required this.posts});
}

final class GetPostsError extends PostsState {

  final String message;

  GetPostsError(this.message);
}

// update posts states

final class UpdatePostLoading extends PostsState {}

final class UpdatePostSuccess extends PostsState {}

final class UpdatePostError extends PostsState {

  final String message;

  UpdatePostError(this.message);
}

// delete posts states

final class DeletePostLoading extends PostsState {}

final class DeletePostSuccess extends PostsState {}

final class DeletePostError extends PostsState {

  final String message;

  DeletePostError(this.message);
}

// get profile pic states


final class GetProfilePicSuccess extends PostsState {
  
}

final class GetProfilePicError extends PostsState {

  final String message;

  GetProfilePicError(this.message);
}