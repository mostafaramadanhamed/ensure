import 'package:ensure/core/theme/text_styles.dart';
import 'package:ensure/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';

import 'widgets/conversation/add_conversation_item.dart';

class AddConversationScreen extends StatelessWidget {
  final List<ProfileModel> users;
  const AddConversationScreen({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Conversation'),
      ),
      body: users.isNotEmpty
          ? ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return AddConversationItem(
                  user: users[index],
                );
              },
            )
          :  Center(
              child: Text('No users found',
              style: TextStyles.font17SemiBold,
              ),
            ),
    );
  }
}
