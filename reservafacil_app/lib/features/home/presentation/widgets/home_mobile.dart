import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/utils/logger.dart';
import 'package:reservafacil_app/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_app/features/reservation/presentation/pages/reservation_page.dart';
import 'package:reservafacil_app/features/restaurant/presentation/widgets/restaurant_mobile.dart';
import 'package:reservafacil_app/features/search/presentation/pages/search_page.dart';
import 'package:reservafacil_app/features/settings/presentation/widgets/settings_mobile.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  final List<Widget> _pages = [
    // ignore: prefer_const_constructors
    RestaurantMobile(),
    // ignore: prefer_const_constructors
    SearchPage(),
    // ignore: prefer_const_constructors
    ReservationPage(),
    // ignore: prefer_const_constructors
    SettingsMobile(),
  ];

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    Logger.log(loginProvider.loginModel);

    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryAlternative,
        selectedLabelStyle: TextStyle(
          fontSize: 8,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 8,
        ),
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.home_outline,
              size: 24,
            ),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.search,
              size: 24,
            ),
            label: "Busca",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.ticket_outline,
              size: 24,
            ),
            label: "Reservas",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Ionicons.menu,
              size: 24,
            ),
            label: "Opções",
          ),
        ],
      ),
    );
  }
}
