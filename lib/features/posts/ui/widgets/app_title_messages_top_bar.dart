import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class AppTitleAndMessageIcon extends StatelessWidget {
  const AppTitleAndMessageIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 32.h,
      ),
      child: Row(
        children: [
          Text(
            'Ensure',
            style: TextStyles.fontAppName,
          ),
          const Spacer(),
          IconButton(
              onPressed: () { 
               context.pushNamed(Routes.search);
              },
              icon: const Icon(
                Icons.search_rounded,
                color: AppColors.coralPink,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.message_rounded,
                color: AppColors.coralPink,
              )),
        ],
      ),
    );
  }
}
