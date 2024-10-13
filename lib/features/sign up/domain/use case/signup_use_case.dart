import '../../data/models/user_model.dart';
import '../../data/repos/signup_repository.dart';

class SignupUseCase {
  final SignUpRepository signUpRepository;

  SignupUseCase({required this.signUpRepository});

  Future<void> signUp(UserModel user) async {
    return await signUpRepository.signUp(user);
  }
}