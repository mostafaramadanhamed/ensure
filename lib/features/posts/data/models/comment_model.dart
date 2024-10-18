class CommentModel {
  final int postId;
  final String authorId;
  final String content;
  final String authorName;
  final String authorProfilePic;
  final DateTime createdAt;

  CommentModel({
    required this.postId,
    required this.authorId,
    required this.content,
    required this.authorName,
    required this.authorProfilePic,
    required this.createdAt,
  });
}