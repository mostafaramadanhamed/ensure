import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/widgets/app_text_button.dart';
import 'package:ensure/core/widgets/app_text_filed.dart';
import 'package:ensure/features/posts/ui/widgets/add_post_bloc_listener.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/text_styles.dart';
import '../domain/cubit/posts_cubit.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: SingleChildScrollView(
        child: Form(
          key: context.read<PostsCubit>().formKey,
          child: Column(
            children: [
              35.ph,
              Text('Add Post', style: TextStyles.font20SemiBold),
              25.ph,
              AppTextFormField(
                label: 'Text',
                hintText: "Enter your text",
                controller: context.read<PostsCubit>().textController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                maxLines: 24,
                maxLength: 1400,
                keyboardType: TextInputType.multiline,
              ),
              25.ph,
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.emoji_emotions_outlined),
                  ),
                  20.pw,
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.image),
                  ),
                  20.pw,
                  Expanded(
                      child: AppTextButton(
                    buttonText: 'Post',
                    onPressed: () {
                     if(context.read<PostsCubit>().formKey.currentState!.validate()){
                       context.read<PostsCubit>().addPost();
                     }
                    },
                    buttonHeight: 55.h,
                  )),
                  
                ],
              ),
              20.ph,
              const AddPostBlocListener()
            ],
          ),
        ),
      ),
    );
  }
}
