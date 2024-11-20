import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/posts/ui/widgets/shimmer_post_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../posts/domain/cubit/posts_cubit.dart';
import '../../posts/ui/widgets/post_item.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Explore'.tr()),
      centerTitle: true,
      ),
      body: FutureBuilder(
        future: context.read<PostsCubit>().getTrendingPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ShimmerPostLoading();
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Posts'.tr()));
          }
          final posts = snapshot.data!;
          return ListView.separated(
            separatorBuilder: (context, index) =>16.ph,
            
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostItem(post: posts[index]);
            },
          );
        },),
      );
  }
}