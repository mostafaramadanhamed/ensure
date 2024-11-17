

 import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/cubit/chat_state.dart';
import 'conversation_item.dart';

Widget buildScreenWithEmptyConversations() {
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

  Widget buildConversations(FetchConversationsSuccess state) {
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
  }
