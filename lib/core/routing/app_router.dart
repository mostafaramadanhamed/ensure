import 'package:ensure/core/di/dependency_injection.dart';
import 'package:ensure/core/routing/routes.dart';
import 'package:ensure/features/home/ui/home_screen.dart';
import 'package:ensure/features/login/ui/login_screen.dart';
import 'package:ensure/features/onboarding/ui/onboarding_screen.dart';
import 'package:ensure/features/sign%20up/domain/cubit/sign_up_cubit.dart';
import 'package:ensure/features/sign%20up/ui/signup_screen.dart';
import 'package:ensure/features/stories/ui/story_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/profile/ui/profile_screen.dart';
import '../../features/profile/ui/setup_profile.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
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
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Routes.story:
        return MaterialPageRoute(builder: (context) => const StoryScreen());

      case Routes.profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());

      case Routes.setupProfile:
        return MaterialPageRoute(
            builder: (context) => const SetupProfileScreen());

      default:
        return null;
    }
  }
}
