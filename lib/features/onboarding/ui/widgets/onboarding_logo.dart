import 'package:ensure/core/utils/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingLogo extends StatelessWidget {
  const OnboardingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
     Assets.onboardingLogo,
     height: 250.h,
     
    );
  }
}