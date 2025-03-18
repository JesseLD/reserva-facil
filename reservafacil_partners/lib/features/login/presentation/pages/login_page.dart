import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/widgets/app_responsive.dart';
import 'package:reservafacil_partners/features/login/presentation/widgets/login_desktop.dart';
import 'package:reservafacil_partners/features/login/presentation/widgets/login_mobile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return AppResponsive(
      mobile: LoginMobile(),
      desktop: LoginDesktop(),
    );
  }
}
