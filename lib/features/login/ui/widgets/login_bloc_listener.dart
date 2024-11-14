import 'package:easy_localization/easy_localization.dart';
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';

import '../../../../core/theme/text_styles.dart';
import '../../domain/cubit/cubit/login_cubit.dart';
import '../../domain/cubit/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
               
              ),
            ),
          );
        } else if (state is LoginSuccess) {
         {
          context.pop();
           context.pushReplacementNamed(Routes.home);
           }
        } else if (state is LoginError) {
          setupErrorState(context, state.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context,String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15Regular,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it'.tr(),
              style: TextStyles.font15SemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
