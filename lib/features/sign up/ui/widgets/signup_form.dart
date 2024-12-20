import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/spacing_extension.dart';
import 'package:ensure/features/sign%20up/domain/cubit/sign_up_cubit.dart';
import 'package:ensure/features/sign%20up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_regx.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_filed.dart';
import '../../../login/ui/widgets/or.dart';
import '../../../login/ui/widgets/sign_google_button.dart';
import 'have_an_account.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            label: 'Name'.tr(),
            keyboardType: TextInputType.name,
            maxLines: 1,
            validator: (name) {
              if (name!.isEmpty|| name == "") {
                return "Name cannot be empty".tr();
              }
              return null;
            },
            hintText: "Enter your name".tr(),
            controller: context.read<SignUpCubit>().nameController,
          ),
          20.ph,
          AppTextFormField(
            label: 'Email'.tr(),
            hintText: "Enter your email".tr(),
            maxLines: 1,
            validator: (email) {
              if (email == null || email.isEmpty || !AppRegex.isEmailValid(email)) {
                return 'Please enter a valid email'.tr();
              }
            },
            keyboardType: TextInputType.emailAddress,
            controller:context.read<SignUpCubit>().emailController,
          ),
          20.ph,
          AppTextFormField(
            label: 'Password'.tr(),
            hintText: "Enter your password".tr(),
            isObscureText: isObscureText,
            validator: (password) {
             if (password == null ||
                  password.isEmpty
                  ) {
                return 'Please enter a valid password'.tr();
              }

            },
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              icon: Icon(
                isObscureText ? Icons.remove_red_eye : Icons.visibility_off,
              ),
            ),
          controller: context.read<SignUpCubit>().passwordController,
          ),
          20.ph,
           AppTextFormField(
            label: 'Bio'.tr(),
            hintText: "Enter your bio".tr(),
            controller: context.read<SignUpCubit>().bioController,
            maxLength: 70,
            maxLines: 2,
            keyboardType: TextInputType.multiline,
           
          
          ),
          20.ph,
          AppTextFormField(
            label: 'Phone Number'.tr(),
            hintText: "Enter your phone number".tr(),
            keyboardType: TextInputType.phone,
            controller: context.read<SignUpCubit>().phoneController,
            validator: (phone) {
              if (phone == null || phone.isEmpty || !AppRegex.isPhoneNumberValid(phone)) {
                return 'Please enter a valid phone number'.tr();
              }
              return null;
            },
          ),
          20.ph,
          AppTextButton(
            buttonText: "Sign Up".tr(),
            onPressed: ()  {
              if(context.read<SignUpCubit>().formKey.currentState!.validate()){
                context.read<SignUpCubit>().onSignUp();
              }
            },
          ),
          20.ph,
          const HaveAnAccount(),
          20.ph,
          const OrRow(),
          20.ph,
          const SignGoogleButton(
            isSignup: true,
          ),
          20.ph,
          const SignupBlocListener(),
          20.ph,
        ],
      ),
    );
  }
}
