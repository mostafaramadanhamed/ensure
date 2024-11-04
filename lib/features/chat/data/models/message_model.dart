class MessageModel {
  final int id;
  final String content;
  final String senderId;
  final String receiverId;
  final DateTime createdAt;
  final int conversationId;
  final bool isRead;

  MessageModel({
    required this.id,
    required this.content,
    required this.senderId,
    required this.receiverId,
    required this.createdAt,
    required this.conversationId,
    required this.isRead,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      content: json['content'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      createdAt: DateTime.parse(json['created_at']),
      conversationId: json['conversation_id'],
      isRead: json['is_read'],
    );
  }
}
