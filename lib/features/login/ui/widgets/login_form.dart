import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_regx.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_filed.dart';
import '../../domain/cubit/cubit/login_cubit.dart';
import 'dont_have_an_account.dart';
import 'or.dart';
import 'sign_google_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
           AppTextFormField(
            label: 'Email',
            hintText: "Enter your email",
            controller: context.read<LoginCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
            maxLines: 1,
           
               validator: (value) {
           if (value == null ||
               value.isEmpty ||
               !AppRegex.isEmailValid(value)) {
             return 'Please enter a valid email';
           }
         },
          ),
          20.ph,
           AppTextFormField(
            label: 'Password',
            hintText: "Enter your password",
            isObscureText: true,
            maxLines: 1,
            controller: context.read<LoginCubit>().passwordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty|| !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
          ),
          20.ph,
          AppTextButton(
            buttonText: "Login",
            onPressed: () {
              if (context.read<LoginCubit>().formKey.currentState!.validate()) {
                context.read<LoginCubit>().login();
              }
            },
          ),
          20.ph,
          const DontHaveAccount(),
          20.ph,
          const OrRow(),
          20.ph,
          const SignGoogleButton(),
          const LoginBlocListener(),
        ],
      ),
    );
  }}
