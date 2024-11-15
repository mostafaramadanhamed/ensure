import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/core/theme/colors.dart';
import 'package:ensure/core/theme/text_styles.dart';
import 'package:ensure/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';
import 'widgets/onboarding_logo.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          const OnboardingLogo(),
          55.ph,
          Text(
            'Let’s Connect Together'.tr(),
            textAlign: TextAlign.center,
            style: TextStyles.font36Bold,
          ),
          33.ph,
          AppTextButton(
            buttonText: "Login".tr(),
            borderRadius: 50.r,
            onPressed: () {
              context.pushNamed(Routes.login);
            },
            backgroundColor: AppColors.white,
            textColor: Colors.black,
          ),
          25.ph,
          AppTextButton(
            buttonText: "Sign Up".tr(),
            borderRadius: 50.r,
            onPressed: () {
              context.pushNamed(Routes.signup);
            },
         
          )
                    ],
                  ),
        ));
  }
}
