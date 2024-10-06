import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_filed.dart';
import 'dont_have_an_account.dart';
import 'or.dart';
import 'sign_google_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        AppTextButton(
          buttonText: "Login",
          onPressed: () {
            context.pushNamed(Routes.home);
          },
        ),
        20.ph,
        const DontHaveAccount(),
        20.ph,
        const OrRow(),
        20.ph,
        const SignGoogleButton(),
      ],
    );
  }}
