
import 'package:ensure/features/login/domain/use%20cases/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());
  
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      await loginUseCase.login(email, password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
