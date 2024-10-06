import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/theme/colors.dart';
import 'package:ensure/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 32.h,
          ),
          child: const AppTitleAndMessageIcon(),
        ),
        24.ph,
        SizedBox(
          height: 80.h,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 16.w),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return index == 0
                  ? CircleAvatar(
                      radius: 35.r,
                      child: const Icon(
                        Icons.add_box_rounded,
                        color: Colors.white,
                      ),
                      backgroundColor: AppColors.oldRose,
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
          ),
        ),
      28.ph,
      ],
    );
  }
}

class AppTitleAndMessageIcon extends StatelessWidget {
  const AppTitleAndMessageIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Ensure',
          style: TextStyles.fontAppName,
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message_rounded,
              color: AppColors.coralPink,
            )),
      ],
    );
  }
}
