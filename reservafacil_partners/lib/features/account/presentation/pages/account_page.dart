import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/widgets/app_responsive.dart';
import 'package:reservafacil_partners/features/account/presentation/widgets/account_mobile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return AppResponsive(mobile: const AccountMobile());
  }
}
