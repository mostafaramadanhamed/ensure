import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../posts/data/models/post_model.dart';
import '../../domain/cubit/profile_cubit.dart';
import 'profile_post_item.dart';

class PostsPorfile extends StatelessWidget {
    final String userId; // Pass the user ID to fetch data for specific user


  const PostsPorfile({
    super.key, required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PostModel>>(
        future: context.read<ProfileCubit>().getPostsByUserId(userId), // Fetch posts based on user ID
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Posts'));
          }
    
          final posts = snapshot.data!;
          return ListView.separated(
            separatorBuilder: (context, index) => 16.ph,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return ProfilePostItem(post: posts[index],userId: userId,);
            },
          );
        },
      );
  }
}
