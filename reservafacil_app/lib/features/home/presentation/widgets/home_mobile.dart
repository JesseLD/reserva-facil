import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/utils/logger.dart';
import 'package:reservafacil_app/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_app/features/restaurant/presentation/widgets/restaurant_mobile.dart';
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
    Placeholder(),
    // ignore: prefer_const_constructors
    Placeholder(),
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
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryAlternative,
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 28,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 28,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.confirmation_num_outlined,
                size: 28,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
                size: 28,
              ),
              label: ""),
        ],
      ),
    );
  }
}
