import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservafacil_app/common/constants/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/router/app_router.dart';
import 'package:reservafacil_app/features/onboarding/presentation/pages/onboarding_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [],
    //   child: MaterialApp(
    //     title: "Reserva Fácil",
    //     theme: AppThemes.lightTheme.copyWith(
    //       textTheme: GoogleFonts.interTextTheme(),
    //     ),
    //     initialRoute: '/',
    //     onGenerateRoute: AppRouter.onGenerateRoute,
    //     debugShowCheckedModeBanner: false,
    //     // home: ,
    //   ),
    // );
    return MaterialApp(
      title: "Reserva Fácil",
      theme: AppThemes.lightTheme.copyWith(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      initialRoute: '/',
      onGenerateRoute: AppRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),
    );
  }
}
