import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/posts/data/models/post_model.dart';
import 'package:ensure/features/posts/ui/widgets/edit_post_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_filed.dart';
import '../domain/cubit/posts_cubit.dart';

class EditPost extends StatelessWidget {
  final PostModel post;
  const EditPost({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: SingleChildScrollView(
          child: Form(
            key: context.read<PostsCubit>().formKey,
            child: Column(
              children: [
                35.ph,
                Text('Edit Post'.tr(), style: TextStyles.font20SemiBold),
                25.ph,
                AppTextFormField(
                  hintText: post.text,
                  onChanged: (text) {
                    context.read<PostsCubit>().textController.text = text;
                  },
                  controller: context.read<PostsCubit>().textController,
                  maxLines: null,
                  maxLength: 1400,
                  keyboardType: TextInputType.multiline,
                ),

                // Display the selected image, if any
                post.content == ''
                    ? Container()
                    : Container(
                        height: 200.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.network(post.content),
                      ),

                25.ph,
                AppTextButton(
                                  buttonText: 'Save'.tr(),
                                  onPressed: () {
                context.read<PostsCubit>().updatePost(
                      PostModel(
                        uId: post.uId,
                        text: context
                            .read<PostsCubit>()
                            .textController
                            .text
                            .trim(),
                        content: post.content,
                        likes: post.likes,
                        comments: post.comments,
                        profilePic: post.profilePic,
                        authorId: post.authorId,
                        authorName: post.authorName,
                        creatdAt: post.creatdAt,
                      ),
                    );
                                  
                          //         await context.read<PostsCubit>().getPosts();
                                  },
                                  buttonHeight: 55.h,
                                ),
               const UpdatePostBlocListener(),
                20.ph,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
