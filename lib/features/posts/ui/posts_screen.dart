import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/posts/ui/widgets/posts_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../stories/ui/widgets/stories_list_view.dart';
import '../domain/cubit/posts_cubit.dart';
import 'widgets/app_title_messages_top_bar.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<PostsCubit>().getPosts();
  }

  Future<void> _refresh() async {
    return Future.delayed(const Duration(seconds: 2,), () {
      if (mounted) context.read<PostsCubit>().getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppTitleAndMessageIcon(),
            24.ph,
            SizedBox(
              height: 80.h,
              child: const StoriesListView(),
            ),
            16.ph,
            const PostsBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
