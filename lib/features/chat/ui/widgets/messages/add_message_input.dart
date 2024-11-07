import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/widgets/app_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/colors.dart';
import '../../../domain/cubit/chat_cubit.dart';

class AddMessageInput extends StatelessWidget {
  final int conversationId;
  final String receiverId;
  const AddMessageInput({super.key, required this.conversationId, required this.receiverId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
        child: Row(
          children: [
             Expanded(
              child: 
                   AppTextFormField(
                    controller: context.read<ChatCubit>().messageController,
                    hintText: "Enter your message",
                                   ),
                
            ),
            
            16.pw,
            GestureDetector(
              onTap: (){
                context.read<ChatCubit>().sendMessage(
                  receiverId: receiverId,
                  conversationId: conversationId,
                );
              },
              child: const Icon(
                Icons.send_outlined,
                color: AppColors.coralPink,
              ),
            ),
        
        ]
        ),
      )
      ],
    );
  }
}
