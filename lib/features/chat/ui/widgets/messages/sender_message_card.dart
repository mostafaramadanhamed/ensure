import 'package:ensure/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/text_styles.dart';

class SenderMessageCard extends StatelessWidget {
  const SenderMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.centerStart,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 0.75.sw,
            minWidth: 0.35.sw,
            minHeight: 0.06.sh,
          ),
          child: Card(
          
            color: AppColors.lighterBrown,
            margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(12.r),
                topEnd: Radius.circular(12.r),
                bottomEnd: Radius.circular(12.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Text(
                'This is Sender message',
                style: TextStyles.font15SemiBold,
              ),
            ),
          ),
        ));
  }
}
