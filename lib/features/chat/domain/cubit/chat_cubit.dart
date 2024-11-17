import 'package:ensure/features/chat/domain/use%20case/chat_use_case.dart';
import 'package:ensure/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utils/methods.dart';
import '../../data/models/conversation_model.dart';
import '../../data/models/message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatUseCase chatUseCase;
  ChatCubit(this.chatUseCase) : super(ChatInitial());
  List<ProfileModel> suggestions = [];
  TextEditingController messageController = TextEditingController();
  Future<void> fetchConversations() async {
    emit(FetchConversationsLoading());
    List<ProfileModel> profiles = [];
    try {
      // get conversations
      final conversations = await chatUseCase.fetchConversations();
      suggestions = await chatUseCase.fetchUsers();
      // get user profile for each conversation
      for (var conversation in conversations) {
        profiles.add(await getUserProfile(
          conversation.user1Id == Supabase.instance.client.auth.currentUser!.id
              ? conversation.user2Id
              : conversation.user1Id,
        ));
      }
      emit(FetchConversationsSuccess(
          conversations: conversations,
          suggestions: suggestions,
          profiles: profiles));
    } catch (e) {
      emit(FetchConversationsError(e.toString()));
      
      rethrow;
    }
  }

  Future<ProfileModel> getUserProfile(String userId) async {
    try {
      final profile = await chatUseCase.getUserProfile(userId);
      return profile;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> addConversation(String user2Id) async {
    try {
      final conversation = ConversationModel(
          user1Id: Supabase.instance.client.auth.currentUser!.id,
          user2Id: user2Id,
          createdAt: DateTime.now(),
          conversationId: getCurrentTimeInMillis(DateTime.now()));
      await chatUseCase.addConversation(conversation);
      return conversation.conversationId;
    } catch (e) {
      
      rethrow;
    }
  }

  Future<void> fetchMessages(int conversationId) async {
    emit(FetchMessagesLoading());
    try {
      final messages = await chatUseCase.fetchMessages(conversationId);

      emit(FetchMessagesSuccess(
        messages: messages,
      ));
    } catch (e) {
      emit(FetchMessagesError(e.toString()));
      
      rethrow;
    }
  }

  Future<void> sendMessage({
    required int conversationId,
    required String receiverId,
  }) async {
    try {
      await chatUseCase.sendMessage(MessageModel(
        conversationId: conversationId,
        senderId: Supabase.instance.client.auth.currentUser!.id,
        content: messageController.text.trim(),
        createdAt: DateTime.now(),
        receiverId: receiverId,
        isRead: false,
        messageId: getCurrentTimeInMillis(DateTime.now()),
      ));

      messageController.clear();
      fetchMessages(conversationId);
    } catch (e) {
      
      rethrow;
    }
  }

  Future<void> markMessageAsRead(int messageId) async {
    try {
      await chatUseCase.markMessageAsRead(messageId);
    } catch (e) {
      
      rethrow;
    }
  }
}
