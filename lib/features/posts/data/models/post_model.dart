class PostModel {
  final int uId;
  final String text;
  final String content;
  final int likes;
  final int comments;
  final DateTime creatdAt;

  PostModel( {required this.uId,
    required this.text,
    required this.content,
    required this.likes,
    required this.comments,
    required this.creatdAt,
  });

  // create from map
  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel( uId: map['custom_id'] as int,
      text: map['text'] as String,
      content: map['content'] as String,
      likes: map['likes'] as int,
      comments: map['comments'] as int,
      creatdAt: DateTime.parse(map['created_at'] as String),
    );
  }
}
