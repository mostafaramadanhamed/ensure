import 'package:flutter/material.dart';

import 'my_message_card.dart';
import 'sender_message_card.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (index%2 == 0) {
          return const MyMessageCard();
        }
        return const SenderMessageCard();
      },
    );
  }
}
