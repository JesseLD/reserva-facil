import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_painel/core/shared/route_generator.dart';
import 'package:reservafacil_painel/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_painel/theme/light_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute = "/login";

  @override
  void initState() {
    super.initState();

    if (Provider.of<LoginProvider>(context, listen: false).isLogged) {
      initialRoute = "/home";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Painel Gestor | Reserva Fácil',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
