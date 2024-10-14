import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/widgets/app_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/app_text_button.dart';

class SetupProfileScreen extends StatelessWidget {
  const SetupProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.ph,
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 70.r,
                    child: Icon(
                      Icons.person,
                      size: 75.r,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                  Positioned(
                    bottom: -8.h,
                    right: -4.w,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_a_photo_rounded,
                        color: AppColors.oldRose,
                        size: 32.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            45.ph,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Enter your bio",
                style: TextStyles.font20SemiBold,
              ),
            ),
            8.ph,
            const AppTextFormField(
              hintText: "Enter your bio",
              label: "Bio",
              maxLines: 2,
            ),
            24.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextButton(
                  buttonText: "Save",
                  onPressed: () {},
                  buttonWidth: 120.w,
                ),
                20.pw,
                AppTextButton(
                  buttonText: "Skip",
                  onPressed: () {},
                  buttonWidth: 120.w,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
