class CommentModel {
  final int commentId;
  final int postId;
  final String authorId;
  final String content;
  final String authorName;
  final String authorProfilePic;
  final DateTime createdAt;

  CommentModel({
    required this.postId,
    required this.commentId,
    required this.authorId,
    required this.content,
    required this.authorName,
    required this.authorProfilePic,
    required this.createdAt,
  });

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      postId: map['post_id'],
      commentId: map['comment_id'],
      authorId: map['author_id'],
      content: map['content'],
      authorName: map['author_name'],
      authorProfilePic: map['author_profile_pic'],
      createdAt: DateTime.parse(map['created_at']),
    );
  }
}
