import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';
import 'package:reservafacil_app/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_app/features/settings/presentation/widgets/drawer/drawer_group.dart';
import 'package:reservafacil_app/features/settings/presentation/widgets/drawer/drawer_item.dart';
import 'package:reservafacil_app/features/settings/presentation/widgets/drawer/info_widget.dart';

class SettingsMobile extends StatefulWidget {
  const SettingsMobile({super.key});

  @override
  State<SettingsMobile> createState() => _SettingsMobileState();
}

class _SettingsMobileState extends State<SettingsMobile> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      width: double.infinity,
      backgroundColor: Colors.white,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryAlternative,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Text(
                          loginProvider.userModel.name[0],
                          style: AppTextStyles.title
                              .copyWith(color: AppColors.gray),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Olá,',
                          style: AppTextStyles.body.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          loginProvider.userModel.name,
                          style: AppTextStyles.title.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          if (!loginProvider.userModel.verified)
            InfoWidget(
              type: InfoType.warning,
              title: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text(
                  "Seu e-mail ainda não foi verificado. Verifique sua caixa de entrada ou reenvie o e-mail de confirmação. ",
                  softWrap: true,
                ),
              ),
            ),
          if (!loginProvider.userModel.verified)
            InfoWidget(
              type: InfoType.harmful,
              title: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Verifique seu e-mail em até 6 dias para evitar que sua conta seja desativada.",
                  softWrap: true,
                  style: AppTextStyles.body.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          const SizedBox(
            height: 24,
          ),
          DrawerGroup(
            title: Text(
              'Geral',
              style: AppTextStyles.subtitle.copyWith(
                color: AppColors.gray,
                fontSize: 20,
              ),
            ),
            children: [
              DrawerItem(
                icon: Icons.person_2_outlined,
                title: "Sua Conta",
                notification: 1,
                onTap: () {
                  Navigator.pushNamed(context, '/account');
                },
              ),
              DrawerItem(
                icon: Icons.notifications_outlined,
                title: "Notificações",
                onTap: () {
                  Navigator.pushNamed(context, '/account');
                },
              ),
              DrawerItem(
                icon: Icons.logout_outlined,
                title: "Sair",
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/',
                    (route) => false,
                  );
                },
              ),
              DrawerItem(
                icon: Icons.delete_forever_outlined,
                title: "Excluir Conta",
                onTap: () {
                  Navigator.pushNamed(context, '/account');
                },
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          DrawerGroup(
            title: Text(
              'Feedback',
              style: AppTextStyles.subtitle.copyWith(
                color: AppColors.gray,
                fontSize: 20,
              ),
            ),
            children: [
              DrawerItem(
                icon: Icons.warning_amber_outlined,
                title: "Reportar Problema",
                onTap: () {
                  Navigator.pushNamed(context, '/account');
                },
              ),
              DrawerItem(
                icon: Icons.send_outlined,
                title: "Enviar Sugestão",
                onTap: () {
                  Navigator.pushNamed(context, '/account');
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
