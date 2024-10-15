import 'package:ensure/features/login/data/repos/login_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/utils/constants.dart';

class LoginRepoImpl implements LoginRepo {
  final SupabaseClient supabase;

  LoginRepoImpl({required this.supabase});

  @override
  Future<void> login(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
      await saveUserToken(supabase.auth.currentUser!.id);
    } catch (e) {
      throw Exception(e);
    }
  } 
 Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
   
  }
}
