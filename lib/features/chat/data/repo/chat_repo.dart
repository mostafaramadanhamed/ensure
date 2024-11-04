import '../models/conversation_model.dart';
import '../models/message_model.dart';
abstract class ChatRepository {
  Future<List<ConversationModel>> fetchConversations();
  Future<List<MessageModel>> fetchMessages(int conversationId);
  Future<void> sendMessage(MessageModel message);
  Future<void> markMessageAsRead(int messageId);
}
