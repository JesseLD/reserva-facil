import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';
import 'package:reservafacil_app/common/utils/logger.dart';
import 'package:reservafacil_app/common/widgets/custom_appbar.dart';
import 'package:reservafacil_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:reservafacil_app/features/account/logic/providers/account_provider.dart';
import 'package:reservafacil_app/features/login/logic/providers/login_provider.dart';

class AccountMobile extends StatefulWidget {
  const AccountMobile({super.key});

  @override
  State<AccountMobile> createState() => _AccountMobileState();
}

class _AccountMobileState extends State<AccountMobile> {
  late Future<void> _future;

  // @override
  // void initState() {
  //   super.initState();
  //   _future = _loadUserInfo();
  // }

  // Future<void> _loadUserInfo() async {
  //   // Certifique-se de que `listen: false` está sendo usado
  //   final loginProvider = Provider.of<LoginProvider>(context, listen: false);
  //   final accountProvider =
  //       Provider.of<AccountProvider>(context, listen: false);
  //   await accountProvider.getAccount(loginProvider.userModel.id);
  // }

  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountProvider>(context);

    Logger.log('accountProvider: ${accountProvider.accountModel}');

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            CustomAppBar(
              enableBackButton: true,
              centerTitle: true,
              simple: true,
              title: const Text(
                'Sua Conta',
                style: AppTextStyles.button,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Em breve você poderá editar suas informações pessoais e de contato.',
              style: AppTextStyles.body,
            ),
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                accountProvider.accountModel.imageUrl ?? '',
              ),
              child: accountProvider.accountModel.imageUrl == null
                  ? const Text(
                      'A',
                      style: AppTextStyles.title,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
