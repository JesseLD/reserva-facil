import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/features/restaurant/presentation/widgets/restaurant_mobile.dart';
import 'package:reservafacil_app/features/settings/presentation/pages/settings_page.dart';
import 'package:reservafacil_app/features/settings/presentation/widgets/settings_mobile.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  List<Widget> _pages = [
    RestaurantMobile(),
    Placeholder(),
    Placeholder(),
    SettingsMobile(),
  ];

  int _index = 0;
  @override
  Widget build(BuildContext context) {
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
        items: [
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
