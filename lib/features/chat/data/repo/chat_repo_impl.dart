import 'package:logger/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../profile/data/models/profile_model.dart';
import '../models/conversation_model.dart';
import '../models/message_model.dart';
import 'chat_repo.dart';

class ChatRepoImpl implements ChatRepository {
  final SupabaseClient supabase;

  ChatRepoImpl({required this.supabase});

  @override
  Future<List<ProfileModel>> fetchUsers() async {
      final currentUserId = supabase.auth.currentUser!.id;


    final followingResponse = await supabase
        .from('followers')
        .select('followed_id')
        .eq('follower_id', supabase.auth.currentUser!.id);
    final followedIds =
        (followingResponse.map((e) => e['followed_id'])).toList();
  final conversationsResponse = await supabase
      .from('conversations')
      .select('user1_id, user2_id')
      .or('user1_id.eq.$currentUserId,user2_id.eq.$currentUserId');

  final conversationUserIds = (conversationsResponse as List).expand((e) {
    return [e['user1_id'], e['user2_id']];
  }).where((id) => id != currentUserId).toSet();


    // Step 3: Filter out users in conversations from followed IDs
    final suggestedUserIds =
        followedIds.where((id) => !conversationUserIds.contains(id)).toList();

    // select from profiles where id is in (list of followed ids)
    final response = await supabase
        .from('profiles')
        .select()
        .filter('user_id', 'in', suggestedUserIds);

    return response.map((e) => ProfileModel.fromMap(e)).toList();
  }

  @override
  Future<List<ConversationModel>> fetchConversations() async {
    final userId = supabase.auth.currentUser!.id;
    try {
      final response = await supabase
          .from('conversations')
          .select()
          .or(
            'user1_id.eq.$userId,user2_id.eq.$userId',
          )
          .order('created_at', ascending: false);
      Logger().i(response);
      return response.map((e) => ConversationModel.fromJson(e)).toList();
    } catch (e) {
      Logger().e(e.toString());
      throw Exception(e);
    }
  }

  @override
  Future<int> addConversation(ConversationModel conversation) async {
    await supabase.from('conversations').insert({
      'conversation_id': conversation.conversationId,
      'user1_id': conversation.user1Id,
      'user2_id': conversation.user2Id,
      'created_at': DateTime.now().toIso8601String(),
    });
    return conversation.conversationId;
  }

  @override
  Future<ProfileModel> getUserProfile(String userId) async {
    final response =
        await supabase.from('profiles').select().eq('user_id', userId);
    return response.map((e) => ProfileModel.fromMap(e)).single;
  }

  @override
  Future<List<MessageModel>> fetchMessages(int conversationId) async {
    final response = await supabase
        .from('messages')
        .select('*')
        .eq('conversation_id', conversationId)
        .order('created_at', ascending: true);
    return response.map((e) => MessageModel.fromJson(e)).toList();
  }

  @override
  Future<void> sendMessage(MessageModel message) async {
    await supabase.from('messages').insert({
      'conversation_id': message.conversationId,
      'sender_id': message.senderId,
      'content': message.content,
      'created_at': DateTime.now().toIso8601String(),
      'receiver_id': message.receiverId,
      'is_read': message.isRead,
      'message_id': message.messageId,
    });
  }

  @override
  Future<void> markMessageAsRead(int messageId) async {
    await supabase
        .from('messages')
        .update({'is_read': true}).eq('message_id', messageId);
  }
}
