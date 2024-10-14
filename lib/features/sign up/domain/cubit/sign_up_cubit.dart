import 'package:ensure/core/network/auth_exception_handler.dart';
import 'package:ensure/features/sign%20up/domain/use%20case/signup_use_case.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_model.dart';
import 'signup_state.dart';

class SignUpCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;
  SignUpCubit(this.signupUseCase) : super(SignupInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final String profilePic = "";

  void onSignUp() async {
    if (formKey.currentState!.validate()) {
      emit(SignupLoading());
      try {
        UserModel user = UserModel(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
          bio: bioController.text,
          
        );
        await signupUseCase.signUp(user);
        emit(SignupSuccess());
      } catch (e) {
        
        emit(SignupFailure(AuthExceptionHandler.parseAuthException(e.toString()).message));
      }
    }
  }


}
