import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/theme/colors.dart';
import 'package:ensure/features/posts/ui/widgets/posts_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          28.ph,
          const PostsListView(),
        ],
      ),
    );
  }
}

class StoriesListView extends StatelessWidget {
  const StoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 16.w),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return index == 0
            ? CircleAvatar(
                radius: 35.r,
                backgroundColor: AppColors.oldRose,
                child: const Icon(
                  Icons.add_box_rounded,
                  color: Colors.white,
                ),
              )
            : CircleAvatar(
                radius: 35.r,
                backgroundColor: AppColors.oldRose,
                child: CircleAvatar(
                  radius: 32.r,
                ),
              );
      },
      itemCount: 10,
      separatorBuilder: (context, index) => 12.pw,
    );
  }
}
