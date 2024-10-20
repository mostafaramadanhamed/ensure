import '../models/comment_model.dart';

abstract class CommentsRepo {
  Future<List<CommentModel>> getComments(int postId);
  Future<void> addComment(CommentModel comment);
  Future<void> deleteComment(int commentId, int postId);
}