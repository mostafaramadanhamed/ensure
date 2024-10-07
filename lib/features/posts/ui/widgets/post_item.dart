import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.grey.shade300,
      color: Theme.of(context).cardColor,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      elevation: 8,
      shadowColor: AppColors.melon,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            12.ph,
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Mostafa Ramadan', style: TextStyles.font15SemiBold),
              leading: CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColors.oldRose,
                child: CircleAvatar(
                  radius: 22.r,
                ),
              ),
              trailing: const Icon(Icons.more_horiz_rounded),
            ),
            20.ph,
            Text(
              'Text of the post',
              style: TextStyles.font15SemiBold,
            ),
            20.ph,
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0.r),
              child: Image.network('https://picsum.photos/400/300',
                  fit: BoxFit.cover),
            ),
            14.ph,
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
                Text(
                  '570',
                  style: TextStyles.font12LighterBrownBold,
                ),
                12.pw,
                IconButton(onPressed: () {}, icon: const Icon(Icons.comment)),
                Text('33', style: TextStyles.font12LighterBrownBold),
                12.pw,
                IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                const Spacer(),
                Text('10 min ago', style: TextStyles.font12LighterBrownBold),
              ],
            ),
            14.ph,
          ],
        ),
      ),
    );
  }
}
