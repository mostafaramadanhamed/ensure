

import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/stories/ui/widgets/add_story.dart';
import 'package:ensure/features/stories/ui/widgets/story_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
            ? const AddStory()
            : const StoryItem();
      },
      itemCount: 10,
      separatorBuilder: (context, index) => 12.pw,
    );
  }
}
