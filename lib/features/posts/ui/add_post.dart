import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_filed.dart';
import '../domain/cubit/posts_cubit.dart';
import '../domain/cubit/posts_state.dart';
import 'widgets/add_post_bloc_listener.dart';

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
                maxLines: null,
                maxLength: 1400,
                keyboardType: TextInputType.multiline,
              ),
              16.ph,
              // Display the selected image, if any
              BlocBuilder<PostsCubit, PostsState>(
                builder: (context, state) {
                  if (state is ImagePickerSuccess) {
                    return Container(
                      height: 450.h,
                      width: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        image: DecorationImage(
                          image: FileImage(state.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else if (state is ImagePickerError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is ImagePickerLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),

              25.ph,
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<PostsCubit>().selectImage(context);
                    },
                    icon: const Icon(Icons.image),
                  ),
                  20.pw,
                  Expanded(
                      child: AppTextButton(
                    buttonText: 'Post',
                    onPressed: () {
                      if (context
                          .read<PostsCubit>()
                          .formKey
                          .currentState!
                          .validate()) {
                        context.read<PostsCubit>().addPost();
                      }
                    },
                    buttonHeight: 55.h,
                  )),
                  const AddPostBlocListener()
                ],
              ),

              20.ph,
            ],
          ),
        ),
      ),
    );
  }
}
