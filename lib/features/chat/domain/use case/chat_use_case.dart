import 'package:ensure/features/chat/data/repo/chat_repo.dart';

import '../../data/models/conversation_model.dart';
import '../../data/models/message_model.dart';

class ChatUseCase {
  final ChatRepository chatRepository;

  ChatUseCase({required this.chatRepository});

  Future<List<ConversationModel>> fetchConversations() {
    return chatRepository.fetchConversations();
  }

  Future<List<MessageModel>> fetchMessages(int conversationId) {
    return chatRepository.fetchMessages(conversationId);
  }

  Future<void> sendMessage(MessageModel message) {
    return chatRepository.sendMessage(message);
  }

  Future<void> markMessageAsRead(int messageId) {
    return chatRepository.markMessageAsRead(messageId);
  } 
}
