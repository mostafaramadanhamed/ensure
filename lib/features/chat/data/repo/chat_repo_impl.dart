import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/conversation_model.dart';
import '../models/message_model.dart';
import 'chat_repo.dart';

class ChatRepoImpl implements ChatRepository {
  final SupabaseClient supabase ;

  ChatRepoImpl({required this.supabase});

  @override
  Future<List<ConversationModel>> fetchConversations() async {
    final userId = supabase.auth.currentUser!.id;
    final response = await supabase
        .from('conversations')
        .select('*')
         .or('user1_id.eq.$userId,user2_id.eq.$userId')
        .order('updated_at', ascending: false);
    return response.map((e) => ConversationModel.fromJson(e)).toList();
  }
  
  @override
  Future<List<MessageModel>> fetchMessages(int conversationId) async {
    final response = await supabase
        .from('messages')
        .select('*')
        .eq('conversation_id', conversationId)
        .order('updated_at', ascending: true);
    return response.map((e) => MessageModel.fromJson(e)).toList();
  }

  @override
  Future<void> sendMessage(MessageModel message) async {
    await supabase.from('messages').insert(
      {
        'conversation_id': message.conversationId,
        'sender_id': message.senderId,
        'message': message.content,
        'created_at': message.createdAt,
        'receiver_id': message.receiverId,
        'is_read': message.isRead,
        'message_id': message.messageId,
      }
    ); 
  }

  @override
  Future<void> markMessageAsRead(int messageId) async {
    await supabase
        .from('messages')
        .update({'is_read': true})
        .eq('message_id', messageId);
  }
}