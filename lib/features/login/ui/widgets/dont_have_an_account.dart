import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    super.key,
  });

  @override
  /// Builds a widget that displays a "Don't have an account?" message
  /// with a "Sign up" button.
  ///
  /// This widget is used to prompt the user to sign up for an account
  /// if they don't already have one.
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Display the message "Don't have an account?"
        Text(
          "Don't have an account?".tr(),
          style: TextStyles.font15SemiBold,
        ),
        // Display a button that says "Sign up"
        TextButton(
          onPressed: () {
              context.pushNamed(Routes.signup);

          },
          child: Text(
            "Sign Up".tr(),
            style: TextStyles.font15Regular,
          ),
        ),
      ],
    );
  }

}
