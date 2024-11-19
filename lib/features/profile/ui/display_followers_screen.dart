import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';

class DisplayFollowersScreen extends StatelessWidget {
  final List<ProfileModel> followers;
  const DisplayFollowersScreen({super.key, required this.followers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Followers'.tr()),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: followers.length,
        itemBuilder: (context, index) =>
            FollowerItem(follower: followers[index]),
        separatorBuilder: (context, index) => 16.ph,
      ),
    );
  }
}

class FollowerItem extends StatelessWidget {
  final ProfileModel follower;
  const FollowerItem({super.key, required this.follower});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // navigate to user profile
        context.pushNamed(Routes.profile, arguments: follower.id);
      },
     leading: follower.photoUrl!=''? CircleAvatar(
        backgroundImage: NetworkImage(follower.photoUrl),
      ): const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(follower.name),
      subtitle: Text(follower.bio),
    );
  }
}
