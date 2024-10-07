import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/posts/ui/widgets/post_item.dart';
import 'package:flutter/material.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const PostItem();
      },
      separatorBuilder: (context, index) => 24.ph,
    );
  }
}
