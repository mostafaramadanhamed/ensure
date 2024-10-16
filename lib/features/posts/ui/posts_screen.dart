import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/posts/ui/widgets/posts_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../stories/ui/widgets/stories_list_view.dart';
import 'widgets/app_title_messages_top_bar.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
