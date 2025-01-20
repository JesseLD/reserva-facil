import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/widgets/app_responsive.dart';
import 'package:reservafacil_app/features/login/presentation/widgets/recover_password_mobile.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  @override
  Widget build(BuildContext context) {
    return AppResponsive(mobile: RecoverPasswordMobile());
  }
}