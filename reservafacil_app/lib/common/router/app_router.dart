import 'package:flutter/material.dart';
import 'package:reservafacil_app/features/login/presentation/pages/login_page.dart';
import 'package:reservafacil_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:reservafacil_app/features/register/presentation/pages/register_page.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
  }
}
