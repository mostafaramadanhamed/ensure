 import '../../../data/models/post_model.dart';

abstract class PostsState {}

final class PostsInitial extends PostsState {}

// add posts states
final class AddPostsLoading extends PostsState {}

final class AddPostsSuccess extends PostsState {}

final class AddPostsError extends PostsState {

  final String message;

  AddPostsError(this.message);
}

// get posts states

final class GetPostsLoading extends PostsState {}

final class GetPostsSuccess extends PostsState {

  final List<PostModel> posts;

  GetPostsSuccess({required this.posts});
}

final class GetPostsError extends PostsState {

  final String message;

  GetPostsError(this.message);
}

// update posts states

final class UpdatePostsLoading extends PostsState {}

final class UpdatePostsSuccess extends PostsState {}

final class UpdatePostsError extends PostsState {

  final String message;

  UpdatePostsError(this.message);
}

// delete posts states

final class DeletePostsLoading extends PostsState {}

final class DeletePostsSuccess extends PostsState {}

final class DeletePostsError extends PostsState {

  final String message;

  DeletePostsError(this.message);
}