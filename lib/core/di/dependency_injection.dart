
import 'package:ensure/core/network/supabase_constants.dart';
import 'package:ensure/features/chat/data/repo/chat_repo.dart';
import 'package:ensure/features/chat/domain/cubit/chat_cubit.dart';
import 'package:ensure/features/login/data/repos/login_repo.dart';
import 'package:ensure/features/comments/data/repos/comments_repo.dart';
import 'package:ensure/features/posts/domain/cubit/posts_cubit.dart';
import 'package:ensure/features/posts/domain/use%20case/posts_use_case.dart';
import 'package:ensure/features/search/data/repo/search_repo_impl.dart';
import 'package:ensure/features/setup%20profile/data/repos/setup_profile_repo.dart';
import 'package:ensure/features/sign%20up/data/repos/signup_repository.dart';
import 'package:ensure/features/sign%20up/data/repos/signup_repository_impl.dart';
import 'package:ensure/features/sign%20up/domain/cubit/sign_up_cubit.dart';
import 'package:ensure/features/sign%20up/domain/use%20case/signup_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../features/chat/data/repo/chat_repo_impl.dart';
import '../../features/chat/domain/use case/chat_use_case.dart';
import '../../features/login/data/repos/login_repo_impl.dart';
import '../../features/login/domain/cubit/cubit/login_cubit.dart';
import '../../features/login/domain/use cases/login_use_case.dart';
import '../../features/comments/data/repos/comments_repo_impl.dart';
import '../../features/posts/data/repos/posts_repo.dart';
import '../../features/posts/data/repos/posts_repo_impl.dart';
import '../../features/comments/domain/cubit/comments_cubit.dart';
import '../../features/comments/domain/use case/comments_use_case.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../features/profile/data/repo/profile_repo_impl.dart';
import '../../features/profile/domain/cubit/profile_cubit.dart';
import '../../features/profile/domain/use case/profile_use_case.dart';
import '../../features/search/data/repo/search_repo.dart';
import '../../features/search/domain/cubit/search_cubit.dart';
import '../../features/search/domain/use case/search_use_case.dart';
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

// Register 
  // Repositories
  getIt.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(supabase: getIt()));

  // Use cases
  getIt.registerLazySingleton<SignupUseCase>(
      () => SignupUseCase(signUpRepository: getIt()));

  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  // setup profile

  getIt.registerLazySingleton<SetupProfileRepo>(
      () => SetupProfileRepoImpl(supabase: getIt()));

  getIt.registerLazySingleton<SetupProfileUseCase>(
      () => SetupProfileUseCase(setupProfileRepo: getIt()));                


      getIt.registerFactory<SetupProfileCubit>(() => SetupProfileCubit(getIt()));



  // login

  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepoImpl(supabase: getIt()));

      getIt.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(loginRepo: getIt()));

      getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt()));

      //  posts 

  getIt.registerLazySingleton<PostsRepo>(
      () => PostsRepoImpl(supabaseClient: getIt()));

  getIt.registerLazySingleton<PostsUseCase>(
      () => PostsUseCase(postsRepo: getIt()));


  getIt.registerFactory<PostsCubit>(() => PostsCubit(getIt()));

  // comments 

  getIt.registerLazySingleton<CommentsRepo>(
      () => CommentsRepoImpl(supabaseClient: getIt()));

  getIt.registerLazySingleton<CommentsUseCase>(
      () => CommentsUseCase(commentsRepo: getIt()));

      getIt.registerFactory<CommentsCubit>(() => CommentsCubit(getIt()));

      // profile

      getIt.registerLazySingleton<ProfileRepo>(
      () => ProfileRepoImpl(supabaseClient: getIt()));

      getIt.registerLazySingleton<ProfileUseCase>(
      () => ProfileUseCase(profileRepo: getIt()));

      getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
 

 // search
 
     getIt.registerLazySingleton<SearchRepo>(
      () => SearchRepoImpl(supabaseClient: getIt()));

      getIt.registerLazySingleton<SearchUseCase>(
      () => SearchUseCase(searchRepo: getIt()));

      getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));

      // chat 

      getIt.registerLazySingleton<ChatRepository>(
      () => ChatRepoImpl(supabase: getIt()));

      getIt.registerLazySingleton<ChatUseCase>(
      () => ChatUseCase(chatRepository: getIt()));

      getIt.registerFactory<ChatCubit>(() => ChatCubit(getIt()));
}