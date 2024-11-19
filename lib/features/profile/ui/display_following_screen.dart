import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/profile/data/models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayFollowingScreen extends StatelessWidget {
  final List<ProfileModel> following;
  const DisplayFollowingScreen({super.key, required this.following});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Following'.tr()),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: following.length,
        itemBuilder: (context, index) =>
            FollowingItem(following: following[index]),
        separatorBuilder: (context, index) => 16.ph,
      ),
    );
  }
}

class FollowingItem extends StatelessWidget {
  final ProfileModel following;
  const FollowingItem({super.key, required this.following});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: following.photoUrl!=''? CircleAvatar(
        backgroundImage: NetworkImage(following.photoUrl),
      ): const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text(following.name),
      subtitle: Text(following.bio),
      
      );
  }
}
