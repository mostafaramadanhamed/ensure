import 'package:flutter/material.dart';

import 'widgets/messages/add_message_input.dart';
import 'widgets/messages/messages_list_view.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('User Name'),
        centerTitle: true,

      ),
      body:const Column(
          children: [
            Expanded(
             child:  MessagesListView(),              
            ),
            AddMessageInput(),
          ],
      ),
    );
  }
}
