import 'dart:io';

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
// image picker states

final class ImagePickerLoading extends PostsState {}

final class ImagePickerSuccess extends PostsState {
 final File image;
  
  ImagePickerSuccess({required this.image});
}

final class ImagePickerError extends PostsState {
  final String message;

  ImagePickerError(this.message);
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

// get user details states

final class GetUserDetailsLoading extends PostsState {}

final class GetUserDetailsSuccess extends PostsState {
  final Map<String, dynamic> user;

  GetUserDetailsSuccess({required this.user});
}

final class GetUserDetailsError extends PostsState {
  final String message;

  GetUserDetailsError(this.message);
}

// logout states

final class LogoutLoading extends PostsState {}

final class LogoutSuccess extends PostsState {}

final class LogoutError extends PostsState {
  final String message;

  LogoutError(this.message);
}

// like post states

final class LikePostSuccess extends PostsState {
  final int likes;
  final int postId;

  LikePostSuccess(this.likes, this.postId);
}

final class LikePostError extends PostsState {
  final String message;

  LikePostError(this.message);
}

// unlike post states

final class UnlikePostSuccess extends PostsState {
  final int likes;
  final int postId;
  UnlikePostSuccess(this.likes, this.postId);
}

final class UnlikePostError extends PostsState {
  final String message;

  UnlikePostError(this.message);
}

// is post liked states

final class IsPostLikedSuccess extends PostsState {
  final bool isLiked;
  final int postId;

  IsPostLikedSuccess(this.isLiked, this.postId);
}

final class IsPostLikedError extends PostsState {
  final String message;

  IsPostLikedError(this.message);
}
