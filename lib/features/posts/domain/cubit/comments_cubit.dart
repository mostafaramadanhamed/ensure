
import 'package:ensure/features/posts/domain/use%20case/comments_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/methods.dart';
import '../../data/models/comment_model.dart';
import 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentsUseCase commentsUseCase;
  CommentsCubit(this.commentsUseCase) : super(CommentsInitial());
  final TextEditingController commentController = TextEditingController();
final SupabaseClient supabaseClient = Supabase.instance.client;

 // add comment

  Future<void> addComment(int postId) async {
    emit(AddCommentLoading());
    try {

      await commentsUseCase.addComment(
        CommentModel(
          content: commentController.text,
          commentId: getCurrentTimeInMillis(DateTime.now()),
          postId: postId,
          authorId: supabaseClient.auth.currentUser!.id,
          authorName: supabaseClient.auth.currentUser!.userMetadata!['Display name'],
          authorProfilePic: supabaseClient.auth.currentUser!.userMetadata!['profile_pic'],
          createdAt: DateTime.now(),
          

        ),
      );
      emit(AddCommentSuccess());
      commentController.clear();
      getComments(postId);
    } catch (e) {
      debugPrint(e.toString());
      emit(AddCommentError(e.toString()));
    }
  }

// delete comment
  Future<void> deleteComment(CommentModel comment) async {
    emit(DeleteCommentLoading());
    try {
      await commentsUseCase.deleteComment(comment);
      emit(DeleteCommentSuccess());
    } catch (e) {
      emit(DeleteCommentError(e.toString()));
    }
  }

  // get comments

  Future<void> getComments(int postId) async {
    emit(GetCommentsLoading());
    try {
      final comments = await commentsUseCase.getComments(postId);
      emit(GetCommentsSuccess(comments: comments));
    } catch (e) {
      debugPrint(e.toString());
      emit(GetCommentsError(e.toString()));
    }
  }
}
