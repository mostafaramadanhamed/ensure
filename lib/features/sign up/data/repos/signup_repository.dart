import '../models/user_model.dart';

abstract class SignUpRepository {

  Future<void> signUp(UserModel user);
}
