import 'package:flutter/material.dart';
import 'package:reservafacil_painel/features/home/presentation/pages/home_page.dart';
import 'package:reservafacil_painel/features/login/presentation/pages/login_page.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings route) {
    switch (route.name) {
      case '/login':
        return MaterialPageRoute(
          builder: (builder) => const LoginPage(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (builder) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (builder) => Container(
            color: Colors.white,
            child: const Center(
              child: Text('404 - Page not found'),
            ),
          ),
        );
    }
  }
}
