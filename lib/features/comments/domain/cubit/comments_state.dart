
import '../../data/models/comment_model.dart';

abstract class CommentsState {}

 class CommentsInitial extends CommentsState {}

 // add comment states
 class AddCommentLoading extends CommentsState {}
 class AddCommentSuccess extends CommentsState {}
 class AddCommentError extends CommentsState {

  final String message;

  AddCommentError(this.message);
 }

 // get comments states
 class GetCommentsLoading extends CommentsState {}
 class GetCommentsSuccess extends CommentsState {

  final List<CommentModel> comments;

  GetCommentsSuccess({required this.comments});
 }
 class GetCommentsError extends CommentsState {

  final String message;

  GetCommentsError(this.message);
 }

 // delete comment states
 class DeleteCommentLoading extends CommentsState {}
 class DeleteCommentSuccess extends CommentsState {}
 class DeleteCommentError extends CommentsState {

  final String message;

  DeleteCommentError(this.message);
 }
