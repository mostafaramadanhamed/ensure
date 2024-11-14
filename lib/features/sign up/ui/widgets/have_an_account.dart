import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/text_styles.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        Text(
          "Already have an account?".tr(),
          style: TextStyles.font15SemiBold,
        ),
      
        TextButton(
          onPressed: () {
              context.pushNamed(Routes.login);

          },
          child: Text(
            "Login".tr(),
            style: TextStyles.font15Regular,
          ),
        ),
      ],
    );
  }
}

