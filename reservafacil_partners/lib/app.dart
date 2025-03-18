import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reservafacil_partners/common/constants/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/common/providers/global_state_provider.dart';
import 'package:reservafacil_partners/common/router/app_router.dart';
import 'package:reservafacil_partners/core/config/logic/providers/config_provider.dart';
import 'package:reservafacil_partners/features/account/logic/providers/account_provider.dart';
import 'package:reservafacil_partners/features/address/logic/providers/address_provider.dart';
import 'package:reservafacil_partners/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_partners/features/login/logic/providers/recover_password_provider.dart';
import 'package:reservafacil_partners/features/register/logic/providers/register_provider.dart';
import 'package:reservafacil_partners/features/reservation/logic/providers/reservation_provider.dart';
import 'package:reservafacil_partners/features/restaurant/logic/providers/restaurant_provider.dart';
import 'package:reservafacil_partners/features/splash/presentation/pages/splash_page.dart';

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

  // _loadPrefs() async {
  //   // Load preferences

  //   final prefs = await SharedPreferences.getInstance();
  // }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalStateProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
        ChangeNotifierProvider(create: (_) => RecoverPasswordProvider()),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
        ChangeNotifierProvider(create: (_) => ConfigProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
        ChangeNotifierProvider(create: (_) => ReservationProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
      ],
      child: MaterialApp(
        title: "Reserva Fácil Parceiros",
        theme: AppThemes.lightTheme.copyWith(
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: '/',
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
