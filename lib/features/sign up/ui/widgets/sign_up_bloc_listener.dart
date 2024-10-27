
import 'package:ensure/core/helpers/navigation_extension.dart';
import 'package:ensure/core/theme/colors.dart';
import 'package:ensure/features/sign%20up/data/models/user_model.dart';
import 'package:ensure/features/sign%20up/domain/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/cubit/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignupState>(
      listenWhen: (previous, current) =>
      current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupFailure,
      listener: (context, state) {
       if(state is SignupLoading) {
        
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.oldRose,
                ),
              ),
            );
        
       }
       
        if  (state is SignupSuccess) {
           context.pop();
            showSuccessDialog(context,state.user);
        }
          
           if (state is SignupFailure) {
          setupErrorState(context, state.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context, UserModel user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Signup Successful'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Congratulations, you have signed up successfully!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              // style: TextButton.styleFrom(
              //   foregroundColor: Colors.white,
              //   backgroundColor: Colors.blue,
              //   disabledForegroundColor: Colors.grey,
              // ),
              onPressed: () {
                context.pushNamed(Routes.setupProfile,
                arguments:user,
                 );
              },
              child: const Text('Continue'),
            ),
          ],
        );
      },
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
          style: TextStyles.font15SemiBold,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font15Regular,
            ),
          ),
        ],
      ),
    );
  }
}