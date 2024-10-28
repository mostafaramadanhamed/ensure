import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/routing/routes.dart';
import 'package:ensure/core/theme/colors.dart';
import 'package:ensure/core/theme/text_styles.dart';
import 'package:ensure/features/search/data/models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchedUserItem extends StatelessWidget {
  final SearchModel user;
  const SearchedUserItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),    
      onTap: () {
        context.pushNamed(Routes.profile, arguments: user.userId);
      },
      leading: Container(
        height: 50.h,
        width: 50.w,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          color: AppColors.teaRose,
          shape: BoxShape.circle,
        ),
        child: user.userImage != ''
            ? Image.network(
                user.userImage,
                fit: BoxFit.cover,
              )
            : const Icon(
                Icons.person_outline_rounded,
              ),
      ),
      title: Text(
        user.userName,
        style: TextStyles.font15SemiBold,
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
