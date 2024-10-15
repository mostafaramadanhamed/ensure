import 'package:ensure/features/login/data/repos/login_repo.dart';

class LoginUseCase {
  final LoginRepo loginRepo;

  LoginUseCase({required this.loginRepo});

  Future<void> login(String email, String password) => loginRepo.login(email, password);
}
