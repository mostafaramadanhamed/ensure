import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/features/chat/domain/cubit/chat_cubit.dart';
import 'package:ensure/features/chat/domain/cubit/chat_state.dart';
import 'package:ensure/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/text_styles.dart';
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
                   setupError(state.error, context);
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

  void setupError(String message, BuildContext context) {
     showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          message,
          style: TextStyles.font15SemiBold,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it'.tr(),
              style: TextStyles.font15Regular,
            ),
          ),
        ],
      ),
    );
     }
}
