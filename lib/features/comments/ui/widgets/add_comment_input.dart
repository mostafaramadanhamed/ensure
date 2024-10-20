import 'package:ensure/core/widgets/app_text_filed.dart';
import 'package:ensure/features/comments/domain/cubit/comments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';

class AddCommentInput extends StatelessWidget {
  final int postId;
  const AddCommentInput({
    super.key, required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(16.r),
          left: Radius.circular(16.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              hintText: 'Write a comment...',
              controller: context.read<CommentsCubit>().commentController,
              keyboardType: TextInputType.multiline,
              suffixIcon: IconButton(
                icon: Icon(Icons.send, color: AppColors.coralPink, size: 22.sp),
                onPressed: () {
                  if(context.read<CommentsCubit>().commentController.text.isNotEmpty){
                    context.read<CommentsCubit>().addComment(postId);
                    
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
