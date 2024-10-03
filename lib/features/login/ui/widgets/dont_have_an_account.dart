import 'package:flutter/material.dart';

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
          "Don't have an account?",
          style: TextStyles.font15SemiBold,
        ),
        // Display a button that says "Sign up"
        TextButton(
          onPressed: () {},
          child: Text(
            "Sign up",
            style: TextStyles.font15Regular,
          ),
        ),
      ],
    );
  }

}
