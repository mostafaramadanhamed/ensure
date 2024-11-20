import 'package:ensure/features/posts/domain/cubit/posts_cubit.dart';
import 'package:ensure/features/posts/domain/cubit/posts_state.dart';
import 'package:ensure/features/posts/ui/widgets/posts_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          if (state.posts.isEmpty) {
            return  Center(
              child: Text(
                '\n You have no Friends yet \n Add Friends \n From Search Screen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 40.sp,
                ),
              ),
            );
          }
          return setupSuccess(state.posts);
        } else if (state is GetPostsError) {
          return setupError(state.message);
        } else if (state is GetPostsLoading) {
          return setupLoading();
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget setupError(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(color: Colors.red),
      ),
    );
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
