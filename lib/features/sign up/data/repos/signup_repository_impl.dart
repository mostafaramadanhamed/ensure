import 'package:ensure/features/sign%20up/data/models/user_model.dart';
import 'package:ensure/features/sign%20up/data/repos/signup_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SupabaseClient supabase;
  SignUpRepositoryImpl({required this.supabase});
  @override
  Future<void> signUp(UserModel user) async {
    try {
      await supabase.auth.signUp(
        email: user.email,
        password: user.password,
        data: {
          'Display name': user.name,
          'phone': user.phone,
          'bio': user.bio,
          'profile_pic': user.profilePic,
          'followers': 0,
          'following': 0,
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
