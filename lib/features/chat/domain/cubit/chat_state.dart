import 'package:ensure/features/profile/data/models/profile_model.dart';

import '../../data/models/conversation_model.dart';
import '../../data/models/message_model.dart';

abstract class ChatState {}

final class ChatInitial extends ChatState {}

// fetchConversations State

final class FetchConversationsLoading extends ChatState {}
final class FetchConversationsSuccess extends ChatState {
  final List<ConversationModel> conversations;   
   final List<ProfileModel>suggestions;

  FetchConversationsSuccess({required this.conversations , required this.suggestions});
}

final class FetchConversationsError extends ChatState {
  final String error;
  FetchConversationsError(this.error);
}

// fetchMessages State

final class FetchMessagesLoading extends ChatState {}
final class FetchMessagesSuccess extends ChatState {
  final List<MessageModel> messages;
  FetchMessagesSuccess({required this.messages,});
}

final class FetchMessagesError extends ChatState {
  final String error;
  FetchMessagesError(this.error);
}

// sendMessages State

final class SendMessageSuccess extends ChatState {
  final MessageModel message;
  SendMessageSuccess(this.message);
}

final class SendMessageError extends ChatState {
  final String error;
  SendMessageError(this.error);
} 

// markMessageAsRead State  

final class MarkMessageAsReadSuccess extends ChatState {
  final int messageId;
  MarkMessageAsReadSuccess(this.messageId);
}

final class MarkMessageAsReadError extends ChatState {
  final String error;
  MarkMessageAsReadError(this.error);
}