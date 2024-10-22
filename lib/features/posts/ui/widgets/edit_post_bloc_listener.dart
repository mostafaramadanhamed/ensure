import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/cubit/posts_cubit.dart';
import '../../domain/cubit/posts_state.dart';

class UpdatePostBlocListener extends StatelessWidget {
  const UpdatePostBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostsCubit, PostsState>(
      listenWhen: (previous, current) =>
          current is UpdatePostSuccess ||
          current is UpdatePostLoading ||
          current is UpdatePostError,
      listener: (context, state) {
        if (state is UpdatePostLoading) {
          setupLoadingState(context);
        }  if (state is UpdatePostSuccess) {
          context.pop(); 
          setupSuccessState(context);
        }  if (state is UpdatePostError) {
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
              'Got it',
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
          title: const Text('Post Updated Successful'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
               
                context.pushNamed(Routes.home);
              },
              child: const Text('Continue'),
            ),
          ],
        );
      }
    );
  }
}
