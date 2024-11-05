import 'package:ensure/core/di/dependency_injection.dart';
import 'package:ensure/core/routing/routes.dart';
import 'package:ensure/features/chat/domain/cubit/chat_cubit.dart';
import 'package:ensure/features/chat/ui/conversations_screen.dart';
import 'package:ensure/features/home/ui/home_screen.dart';
import 'package:ensure/features/login/ui/login_screen.dart';
import 'package:ensure/features/onboarding/ui/onboarding_screen.dart';
import 'package:ensure/features/posts/data/models/post_model.dart';
import 'package:ensure/features/posts/domain/cubit/posts_cubit.dart';
import 'package:ensure/features/search/domain/cubit/search_cubit.dart';
import 'package:ensure/features/search/ui/search_screen.dart';
import 'package:ensure/features/sign%20up/domain/cubit/sign_up_cubit.dart';
import 'package:ensure/features/sign%20up/ui/signup_screen.dart';
import 'package:ensure/features/stories/ui/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/chat/ui/messages_screen.dart';
import '../../features/login/domain/cubit/cubit/login_cubit.dart';
import '../../features/comments/domain/cubit/comments_cubit.dart';
import '../../features/comments/ui/comments_screen.dart';
import '../../features/posts/ui/display_post_image_screen.dart';
import '../../features/posts/ui/edit_post.dart';
import '../../features/profile/domain/cubit/profile_cubit.dart';
import '../../features/profile/ui/profile_screen.dart';
import '../../features/setup profile/domain/cubit/setup_profile_cubit.dart';
import '../../features/setup profile/ui/setup_profile.dart';
import '../../features/sign up/data/models/user_model.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());

      case Routes.signup:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: const SignupScreen(),
                ));

      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  lazy: false,
                  create: (context) => getIt<PostsCubit>(),
                  child: const HomeScreen(),
                ));

      case Routes.story:
        return MaterialPageRoute(builder: (context) => const StoryScreen());

      case Routes.profile:
        return MaterialPageRoute(builder: (context) {
          String userId = args.toString();

          debugPrint('user id: $userId');
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      getIt<ProfileCubit>()..getProfile(userId)),
              BlocProvider.value(
                value: getIt<PostsCubit>(), // Use .value to reuse the instance
              ),
            ],
            child: const ProfileScreen(),
          );
        });

      case Routes.comments:
        return MaterialPageRoute(builder: (context) {
          // declare the arguments
          int postId = args as int;
          return BlocProvider(
            create: (context) => getIt<CommentsCubit>(),
            child: CommentsScreen(
              postId: postId,
            ),
          );
        });
      case Routes.setupProfile:
        return MaterialPageRoute(builder: (context) {
          UserModel user = args as UserModel;
          return BlocProvider(
            create: (context) => getIt<SetupProfileCubit>(),
            child: SetupProfileScreen(
              user: user,
            ),
          );
        });
      case Routes.editPost:
        return MaterialPageRoute(builder: (context) {
          // declare the arguments
          PostModel postModel = args as PostModel;
          return BlocProvider.value(
            value: getIt<PostsCubit>(),
            child: EditPost(
              post: postModel,
            ),
          );
        });

      case Routes.search:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => getIt<SearchCubit>(),
            child: const SearchScreen(),
          );
        });

      case Routes.displayImage:
        return MaterialPageRoute(builder: (context) {
          String imageUrl = args as String;
          return DisplayPostImageScreen(imageUrl: imageUrl);
        });
      case Routes.conversations:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => getIt<ChatCubit>()..fetchConversations(),
            child: const ConversationsScreen(),
          );
        });
      case Routes.messages:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider.value(
            value: getIt<ChatCubit>(),
            child: const MessagesScreen(),
          );
        });
      default:
        return null;
    }
  }
}
