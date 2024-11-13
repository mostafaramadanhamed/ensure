import 'package:ensure/features/posts/domain/cubit/posts_cubit.dart';
import 'package:ensure/features/posts/domain/cubit/posts_state.dart';
import 'package:ensure/features/posts/ui/widgets/posts_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shimmer_post_loading.dart';

class PostsBlocBuilder extends StatelessWidget {
  const PostsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      buildWhen: (previous, current) =>
          current is GetPostsSuccess ||
          current is GetPostsError ||
          current is GetPostsLoading,
      builder: (context, state) {
        if (state is GetPostsSuccess) {
          return setupSuccess(state.posts);
        } else if (state is GetPostsError) {
          return setupError();
        } else if (state is GetPostsLoading) {
          return setupLoading();
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupLoading() {
    return const ShimmerPostLoading();
  }

  Widget setupSuccess(posts) {
    return PostsListView(
      posts: posts,
    );
  }
}
