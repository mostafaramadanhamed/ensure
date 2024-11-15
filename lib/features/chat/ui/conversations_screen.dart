import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/chat/domain/cubit/chat_cubit.dart';
import 'package:ensure/features/chat/ui/widgets/conversation/shimmer_conversation_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';
import '../domain/cubit/chat_state.dart';
import 'widgets/conversation/conversation_item.dart';

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
                return ListView.separated(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    top: 16.h,
                  ),
                  separatorBuilder: (context, index) => 16.ph,
                  itemCount: state.conversations.length,
                  itemBuilder: (context, index) {
                    return ConversationItem(
                      profile: state.profiles[index],
                      conversationId: state.conversations[index].conversationId,
                    );
                  },
                );
                } else {
                return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text(
                        'No conversations found.'.tr(),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      24.ph,
                      Text(
                        'Start a conversation by sending a message.'.tr(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ]));
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
