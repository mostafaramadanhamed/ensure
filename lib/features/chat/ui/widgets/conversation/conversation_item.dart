import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../profile/data/models/profile_model.dart';

class ConversationItem extends StatelessWidget {
  final ProfileModel profile;
  const ConversationItem({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.messages, arguments: profile);
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
                  shape: BoxShape.circle,
                  color: AppColors.mistyRose,
                ),
                child: profile.photoUrl != ''
                    ? Image.network(
                        profile.photoUrl,
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Text(
                          profile.name[0],
                          style: TextStyles.font17SemiBold,
                        ),
                      )),
            16.pw,
            Text(
              profile.name,
              style: TextStyles.font17SemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
