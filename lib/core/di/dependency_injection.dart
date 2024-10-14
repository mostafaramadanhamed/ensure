
import 'package:ensure/core/network/supabase_constants.dart';
import 'package:ensure/features/setup%20profile/data/repos/setup_profile_repo.dart';
import 'package:ensure/features/sign%20up/data/repos/signup_repository.dart';
import 'package:ensure/features/sign%20up/data/repos/signup_repository_impl.dart';
import 'package:ensure/features/sign%20up/domain/cubit/sign_up_cubit.dart';
import 'package:ensure/features/sign%20up/domain/use%20case/signup_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/setup profile/data/repos/setup_profile_repo_impl.dart';
import '../../features/setup profile/domain/cubit/setup_profile_cubit.dart';
import '../../features/setup profile/domain/use cases/setup_profile_use_case.dart';

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


  getIt.registerLazySingleton<SetupProfileRepo>(
      () => SetupProfileRepoImpl(supabase: getIt()));

  getIt.registerLazySingleton<SetupProfileUseCase>(
      () => SetupProfileUseCase(setupProfileRepo: getIt()));                


      getIt.registerFactory<SetupProfileCubit>(() => SetupProfileCubit(getIt()));

      
 
}