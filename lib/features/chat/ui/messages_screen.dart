import 'package:ensure/features/chat/domain/cubit/chat_cubit.dart';
import 'package:ensure/features/chat/domain/cubit/chat_state.dart';
import 'package:ensure/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/messages/add_message_input.dart';
import 'widgets/messages/messages_list_view.dart';
import 'widgets/messages/shimmer_message_loading.dart';

class MessagesScreen extends StatelessWidget {
  final ProfileModel user;
  final int conversationId;
  const MessagesScreen({super.key, required this.user, required this.conversationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is FetchMessagesSuccess) {
                  return MessagesListView(messages: state.messages);
                } else if (state is FetchMessagesError) {
                  return Center(
                    child: Text(state.error),
                  );
                }
                else if (state is FetchMessagesLoading) {
                  return const ShimmerMessageLoading(); 
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          AddMessageInput(
            receiverId: user.id,
            conversationId: conversationId,
          ),
        ],
      ),
    );
  }
}
