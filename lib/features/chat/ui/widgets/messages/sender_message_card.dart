import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/theme/colors.dart';
import 'package:ensure/features/chat/data/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/date_time_format_helper.dart';
import '../../../../../core/theme/text_styles.dart';

class SenderMessageCard extends StatelessWidget {
  final MessageModel  message;
  const SenderMessageCard({super.key, required this.message});

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
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message.content,
                    style:
                      TextStyles.font17SemiBold,
                  ),
                  4.ph,
                  Text(formatPostTime(message.createdAt), style: TextStyles.font12LighterBrownBold.copyWith(
                    color: AppColors.teaRose
                  )),
                ],
              ),
            ),
          ),
        ));
  }
}
