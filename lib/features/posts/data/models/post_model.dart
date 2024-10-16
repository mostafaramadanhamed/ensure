class PostModel {
  final int uId;
  final String text;
  final String authorName;
  final String authorId;
  final String content;
  final int likes;
  final int comments;
  final DateTime creatdAt;

  PostModel( {
    required this.authorId,
    required this.uId,required this.authorName, 
    required this.text,
    required this.content,
    required this.likes,
    required this.comments,
    required this.creatdAt,
  });

  // create from map
  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      authorName: map['author_name'] ,
      authorId: map['author_id'] ,
       uId: map['custom_id'],
      text: map['text'],
      content: map['content'] ,
      likes: map['likes'],
      comments: map['comments'] ,
      creatdAt: DateTime.parse(map['created_at'] ),
    );
  }
}
