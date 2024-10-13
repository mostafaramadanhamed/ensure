
import 'package:ensure/core/network/supabase_constants.dart';
import 'package:ensure/features/sign%20up/data/repos/signup_repository.dart';
import 'package:ensure/features/sign%20up/data/repos/signup_repository_impl.dart';
import 'package:ensure/features/sign%20up/domain/cubit/sign_up_cubit.dart';
import 'package:ensure/features/sign%20up/domain/use%20case/signup_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
   await Supabase.initialize(
    url:SupabaseConstants.supabaseUrl,
    anonKey: SupabaseConstants.supabaseKey,
  );

  // Register Supabase client
  getIt.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // Repositories
  getIt.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(supabase: getIt()));

  // Use cases
  getIt.registerLazySingleton<SignupUseCase>(
      () => SignupUseCase(signUpRepository: getIt()));

  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
 
}