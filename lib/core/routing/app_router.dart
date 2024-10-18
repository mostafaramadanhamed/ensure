import 'package:ensure/core/di/dependency_injection.dart';
import 'package:ensure/core/routing/routes.dart';
import 'package:ensure/features/home/ui/home_screen.dart';
import 'package:ensure/features/login/ui/login_screen.dart';
import 'package:ensure/features/onboarding/ui/onboarding_screen.dart';
import 'package:ensure/features/posts/domain/cubit/posts_cubit.dart';
import 'package:ensure/features/sign%20up/domain/cubit/sign_up_cubit.dart';
import 'package:ensure/features/sign%20up/ui/signup_screen.dart';
import 'package:ensure/features/stories/ui/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/domain/cubit/cubit/login_cubit.dart';
import '../../features/posts/ui/comments_screen.dart';
import '../../features/profile/ui/profile_screen.dart';
import '../../features/setup profile/domain/cubit/setup_profile_cubit.dart';
import '../../features/setup profile/ui/setup_profile.dart';

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
                  create: (context) =>getIt<PostsCubit>() ,
                  child: const HomeScreen(),
                ));

      case Routes.story:
        return MaterialPageRoute(builder: (context) => const StoryScreen());

      case Routes.profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());

      case Routes.comments:
        return MaterialPageRoute(builder: (context) {
          // declare the arguments
          int postId = args as int;
          return CommentsScreen(
            postId: postId,
          );
        
        });
      case Routes.setupProfile:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<SetupProfileCubit>(),
                  child: const SetupProfileScreen(),
                ));

      default:
        return null;
    }
  }
}
