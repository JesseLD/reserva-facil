// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reservafacil_app/features/account/presentation/pages/account_page.dart';
import 'package:reservafacil_app/features/home/presentation/pages/home_page.dart';
import 'package:reservafacil_app/features/login/presentation/pages/login_page.dart';
import 'package:reservafacil_app/features/login/presentation/pages/recover_password.dart';
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
          builder: (_) => LoginPage(),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      case '/recover-password':
        return MaterialPageRoute(
          builder: (_) => const RecoverPassword(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case '/account':
        return MaterialPageRoute(
          builder: (_) => const AccountPage(),
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
