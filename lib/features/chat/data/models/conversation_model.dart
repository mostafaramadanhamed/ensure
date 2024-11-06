class ConversationModel {
  final int conversationId;
  final String user1Id;
  final String user2Id;
  final DateTime createdAt;

  ConversationModel({ required this.conversationId, required this.user1Id, required this.user2Id, required this.createdAt});

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      conversationId: json['conversation_id'],
      user1Id: json['user1_id'],
      user2Id: json['user2_id'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
