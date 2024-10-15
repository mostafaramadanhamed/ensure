import 'package:ensure/core/network/auth_exception_handler.dart';
import 'package:ensure/features/login/domain/use%20cases/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> login() async {
    emit(LoginLoading());
    try {
      await loginUseCase.login(emailController.text, passwordController.text);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(
        SupanbaseExceptionHandler.parseException(e.toString()).message));
    }
  }
}
