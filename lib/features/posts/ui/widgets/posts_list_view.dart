import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/posts/data/models/post_model.dart';
import 'package:ensure/features/posts/ui/widgets/post_item.dart';
import 'package:flutter/material.dart';

class PostsListView extends StatelessWidget {
  final List<PostModel> posts;
  const PostsListView({super.key, required this.posts});
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return  PostItem(post: posts[index],);
      },
      separatorBuilder: (context, index) => 24.ph,
    );
  }
}
