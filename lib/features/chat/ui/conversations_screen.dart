import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/features/chat/domain/cubit/chat_cubit.dart';
import 'package:ensure/features/chat/ui/widgets/conversation/shimmer_conversation_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/routing/routes.dart';
import '../domain/cubit/chat_state.dart';
import 'widgets/conversation/setup_conversation_widgets.dart';

class ConversationsScreen extends StatelessWidget {
  const ConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('Conversations'.tr()),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.addConversation,
              arguments: context.read<ChatCubit>().suggestions,
            );
          },
          tooltip: 'Add conversation'.tr(),
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            if (state is FetchConversationsSuccess) {
              if (state.conversations.isNotEmpty) {
                return buildConversations(state);
                } else {
                return buildScreenWithEmptyConversations();
              }
            }

            if (state is FetchConversationsError) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is FetchConversationsLoading) {
              return const ShimmerConversationLoading();
            }
            return const SizedBox.shrink();
          },
        ));
  }

 }
