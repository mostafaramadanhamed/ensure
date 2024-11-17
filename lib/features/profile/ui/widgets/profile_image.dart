

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../data/models/profile_model.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.profile,
  });

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 80.w,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: AppColors.teaRose,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.mistyRose,
            blurRadius: 7.r,
            offset: const Offset(0, 3),
            spreadRadius: 0,
          ),
        ],
      ),
      child: profile.photoUrl != ''
          ? Image.network(profile.photoUrl,
              fit: BoxFit.cover)
          : Icon(
              Icons.person_outline_sharp,
              size: 75.r,
              color: Theme.of(context)
                  .scaffoldBackgroundColor,
            ),
    );
  }
}
