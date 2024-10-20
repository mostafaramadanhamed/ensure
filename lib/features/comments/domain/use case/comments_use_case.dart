import '../../data/models/comment_model.dart';
import '../../data/repos/comments_repo.dart';

class CommentsUseCase {
  final CommentsRepo commentsRepo;

  CommentsUseCase({required this.commentsRepo});

  Future<List<CommentModel>> getComments(int postId) async {
    return await commentsRepo.getComments(postId);
  }

  Future<void> addComment(CommentModel comment) async {
    return await commentsRepo.addComment(comment);
  }

  Future<void> deleteComment(int commentId, int postId) async {
    return await commentsRepo.deleteComment(commentId, postId);
  }
}