import 'package:ensure/features/chat/data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'my_message_card.dart';
import 'sender_message_card.dart';

class MessagesListView extends StatelessWidget {
  final List<MessageModel> messages;
  const MessagesListView({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (messages[index].senderId ==
            Supabase.instance.client.auth.currentUser!.id) {
          return  MyMessageCard(message: messages[index]);
        }
        return  SenderMessageCard(message: messages[index]);
      },
    );
  }
}
