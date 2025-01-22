import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservafacil_app/common/constants/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/router/app_router.dart';
import 'package:reservafacil_app/features/account/logic/providers/account_provider.dart';
import 'package:reservafacil_app/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_app/features/login/logic/providers/recover_password_provider.dart';
import 'package:reservafacil_app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:reservafacil_app/features/register/logic/providers/register_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
  }

  _loadPrefs() async {
    // Load preferences

    final prefs = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => RecoverPasswordProvider()),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
      ],
      child: MaterialApp(
        title: "Reserva Fácil",
        theme: AppThemes.lightTheme.copyWith(
          textTheme: GoogleFonts.interTextTheme(),
        ),
        initialRoute: '/',
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        home: const OnboardingPage(),
      ),
    );
  }
}
