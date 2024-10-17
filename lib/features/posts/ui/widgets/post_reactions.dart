import 'package:ensure/features/posts/domain/cubit/posts_cubit.dart';
import 'package:ensure/features/posts/domain/cubit/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/text_styles.dart';

class PostReactions extends StatelessWidget {
  const PostReactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is GetPostsSuccess) {
          return Row(
            children: [
              Text(
                state.posts.length.toString(),
                style: TextStyles.font15SemiBold,
              ),
              const SizedBox(width: 10),
              Text(
                "Reactions",
                style: TextStyles.font15SemiBold,
              ),
            ],
          );
        } else if (state is GetPostsError) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                      icon: const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 32,
                      ),
                      content: Text(
                        state.message,
                        style: TextStyles.font15SemiBold,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Got it',
                            style: TextStyles.font15Regular,
                          ),
                        ),
                      ]));
        }
        return const SizedBox();
      },
    );
  }
}
