import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/cubit/posts_cubit.dart';
import '../../domain/cubit/posts_state.dart';

class AddPostBlocListener extends StatelessWidget {
  const AddPostBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostsCubit, PostsState>(
      listenWhen: (previous, current) =>
          current is AddPostSuccess || current is AddPostError,
      listener: (context, state) {
        if (state is AddPostLoading) {
          setupLoadingState(context);
        } else if (state is AddPostSuccess) {
          setupSuccessState(context);
        } else if (state is AddPostError) {
          setupErrorState(context, state.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
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

  void setupLoadingState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: AppColors.oldRose,
        ),
      ),
    );
  }

  void setupSuccessState(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:  Text('Post Added Successful'.tr()),
          actions: <Widget>[
            TextButton(
            
              onPressed: () {
                   selectedIndex = 0;
                            context.pushNamed(Routes.home);
                            context.read<PostsCubit>().getPosts();
              },
              child:  Text('Continue'.tr()),
            ),
          ],
        );
      }
    );
  }
}
