import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Widget? widgetLeading;
  final void Function() onTap;
  const SettingItem(
      {super.key,
      required this.title,
      this.widgetLeading,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      //  tileColor: AppColors.mistyRose.withOpacity(0.6),
      contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 16.w),
      splashColor: AppColors.melon,
      selectedTileColor: AppColors.melon,
      leading: widgetLeading,
      title: Text(
        title.tr(),
        style: TextStyles.font15SemiBold,
      ),
      onTap: onTap,
    );
  }
}
