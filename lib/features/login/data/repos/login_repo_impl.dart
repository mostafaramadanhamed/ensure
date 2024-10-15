import 'package:ensure/features/login/data/repos/login_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepoImpl implements LoginRepo {
  final SupabaseClient supabase;

  LoginRepoImpl({required this.supabase});

  @override
  Future<void> login(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
    } catch (e) {
      throw Exception(e);
    }
  } 

}
