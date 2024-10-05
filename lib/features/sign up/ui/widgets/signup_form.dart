import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_filed.dart';
import '../../../login/ui/widgets/or.dart';
import '../../../login/ui/widgets/sign_google_button.dart';
import 'have_an_account.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppTextFormField(
          label: 'Name',
          hintText: "Enter your name",
        ),
        20.ph,
        const AppTextFormField(
          label: 'Email',
          hintText: "Enter your email",
          keyboardType: TextInputType.emailAddress,
        ),
        20.ph,
        const AppTextFormField(
          label: 'Password',
          hintText: "Enter your password",
          isObscureText: true,
        ),
        20.ph,
        const AppTextFormField(
          label: 'Confirm Password',
          hintText: "Enter your password",
          isObscureText: true,
        ),
        20.ph,
        const AppTextFormField(
          label: 'Phone Number',
          hintText: "Enter your phone number",
          keyboardType: TextInputType.phone,
        ),
        20.ph,
        AppTextButton(
          buttonText: "Login",
          onPressed: () {},
        ),
        20.ph,
        const HaveAnAccount(),
        20.ph,
        const OrRow(),
        20.ph,
        const SignGoogleButton(
          isSignup: true,
        ),
      ],
    );
  }
}
