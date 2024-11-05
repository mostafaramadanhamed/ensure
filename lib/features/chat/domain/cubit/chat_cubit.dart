import 'package:ensure/features/chat/domain/use%20case/chat_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/message_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatUseCase chatUseCase;
  ChatCubit(this.chatUseCase) : super(ChatInitial());

  Future<void> fetchConversations() async {
        emit(FetchConversationsLoading());
  try {
      final conversations = await chatUseCase.fetchConversations();
         final suggestedUsers = await chatUseCase.fetchUsers();
      emit(FetchConversationsSuccess(conversations: conversations, suggestions: suggestedUsers));
    } catch (e) {
      emit(FetchConversationsError(e.toString()));
      debugPrint(e.toString());
    }
  }

  Future<void> fetchMessages(int conversationId) async {
    emit(FetchMessagesLoading());
    try {
      final messages = await chatUseCase.fetchMessages(conversationId);
   
      emit(FetchMessagesSuccess(messages: messages,));
    } catch (e) {
      emit(FetchMessagesError(e.toString()));
      debugPrint(e.toString());
    }
  }


  Future<void> sendMessage(MessageModel message) async {
    try {
      await chatUseCase.sendMessage(message);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> markMessageAsRead(int messageId) async {
    try {
      await chatUseCase.markMessageAsRead(messageId);
    } catch (e) {
      debugPrint(e.toString());
    }
  } 

}