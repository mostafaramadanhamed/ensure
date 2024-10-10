

import 'package:flutter/material.dart';

import '../../../posts/ui/widgets/posts_list_view.dart';

class TabBarViews extends StatelessWidget {
  const TabBarViews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      //  controller: _tabController,

      children: [
        PostsListView(),
        Center(
          child: Text(
            'Photos',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Center(
          child: Text(
            'Videos',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
