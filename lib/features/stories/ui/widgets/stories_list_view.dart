

import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';

class StoriesListView extends StatelessWidget {
  const StoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(left: 16.w),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return index == 0
            ? CircleAvatar(
                radius: 35.r,
                backgroundColor: AppColors.oldRose,
                child: const Icon(
                  Icons.add_box_rounded,
                  color: Colors.white,
                ),
              )
            : CircleAvatar(
                radius: 35.r,
                backgroundColor: AppColors.oldRose,
                child: CircleAvatar(
                  radius: 32.r,
                ),
              );
      },
      itemCount: 10,
      separatorBuilder: (context, index) => 12.pw,
    );
  }
}
