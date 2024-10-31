import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.messages);
      },
      child: Container(
        height: 80.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(40.r),
              topEnd: Radius.circular(16.r),
              bottomEnd: Radius.circular(16.r),
              bottomStart: Radius.circular(40.r),
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.mistyRose,
                blurRadius: 4,
                offset: Offset(0, 1),
                spreadRadius: 0,
              ),
            ]),
        child: Row(
          children: [
            Container(
              height: 80.h,
              width: 80.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                color: AppColors.teaRose,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_outline_rounded,
                size: 64,
              ),
            ),
            16.pw,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Name',
                    style: TextStyles.font17SemiBold,
                  ),
                  4.ph,
                  Text(
                    'Last message',
                    style: TextStyles.font15Regular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
