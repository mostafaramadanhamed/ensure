import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../posts/data/models/post_model.dart';
import '../../domain/cubit/profile_cubit.dart';

class TabBarViews extends StatelessWidget {
    final String userId; // Pass the user ID to fetch data for specific user


  const TabBarViews({
    super.key, required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        // Show loading indicator or posts based on loading state
      FutureBuilder<List<PostModel>>(
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
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index].text),
                );
              },
            );
          },
        ),
        const Center(child: Text('Photos')),
        const Center(child: Text('Videos')),
      ],
    );
  }
}
