import 'package:ensure/core/routing/routes.dart';
import 'package:ensure/features/login/ui/login_screen.dart';
import 'package:ensure/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());

      case Routes.home:
        return MaterialPageRoute(builder: (context) => const Text('Home Page'));

      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => const LoginScreen());

      case Routes.register:
        return MaterialPageRoute(
            builder: (context) => const Text('Register Page'));

      case Routes.profile:
        return MaterialPageRoute(
            builder: (context) => const Text('Profile Page'));

      default:
        return null;
    }
  }
}
