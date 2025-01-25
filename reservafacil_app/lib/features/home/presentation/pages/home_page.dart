import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/widgets/app_responsive.dart';
import 'package:reservafacil_app/features/home/presentation/widgets/home_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return AppResponsive(
      mobile: const HomeMobile(),
    );
  }
}
