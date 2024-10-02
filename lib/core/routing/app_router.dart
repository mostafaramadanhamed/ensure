import 'package:ensure/core/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(
          builder: (context) => const Text('Initial Page'),
        );
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const Text('OnBoarding Page'));

      case Routes.home:
        return MaterialPageRoute(builder: (context) => const Text('Home Page'));

      case Routes.login:
        return MaterialPageRoute(
            builder: (context) => const Text('Login Page'));

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
