import 'package:ensure/features/posts/domain/cubit/posts_cubit.dart';
import 'package:ensure/features/posts/domain/cubit/posts_state.dart';
import 'package:ensure/features/posts/ui/widgets/posts_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsBlocBuilder extends StatefulWidget {
  const PostsBlocBuilder({super.key});

  @override
  State<PostsBlocBuilder> createState() => _PostsBlocBuilderState();
}

class _PostsBlocBuilderState extends State<PostsBlocBuilder> {
  @override
  void initState() {
    super.initState();

    context.read<PostsCubit>().getPosts();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      buildWhen: (previous, current) =>
          current is GetPostsSuccess || current is GetPostsError,
      builder: (context, state) {
        if (state is GetPostsSuccess) {
          return setupSuccess(state.posts);
        } else if (state is GetPostsError) {
          return setupError();
        } else if (state is GetPostsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupSuccess(posts) {
    return PostsListView(
      posts: posts,
    );
  }
}
