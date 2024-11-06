import 'package:ensure/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';

import 'widgets/messages/add_message_input.dart';
import 'widgets/messages/messages_list_view.dart';

class MessagesScreen extends StatelessWidget {
  final ProfileModel user;
  const MessagesScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text(user.name),
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
