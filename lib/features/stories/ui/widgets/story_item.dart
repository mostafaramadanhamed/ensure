import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/colors.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.story);
      },
      child: CircleAvatar(
        radius: 35.r,
        backgroundColor: AppColors.oldRose,
        child: CircleAvatar(
          radius: 32.r,
        ),
      ),
    );
  }
}
