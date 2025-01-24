import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/providers/global_state_provider.dart';
import 'package:reservafacil_app/common/utils/logger.dart';
import 'package:reservafacil_app/common/utils/toasts.dart';
import 'package:reservafacil_app/common/widgets/app_responsive.dart';
import 'package:reservafacil_app/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_app/features/onboarding/presentation/widgets/onboarding_mobile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  String email = "";
  String password = "";

  bool _saveLogin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSaveLogin().then((_) => _autoLogin());
  }

  Future<void> _loadSaveLogin() async {
    final prefs = await SharedPreferences.getInstance();

    _saveLogin = prefs.getBool("saveLogin") ?? false;

    if (_saveLogin) {
      String? localEmail = prefs.getString("email");
      String? localPassword = prefs.getString("password");

      if (localEmail != null && localPassword != null) {
        email = localEmail;
        password = localPassword;
        Logger.log("App::Local Login Loaded");
      } else {
        Logger.log("App::Local Login Not Found");
      }
    }
  }

  Future<void> _autoLogin() async {
    final globalStateProvider =
        Provider.of<GlobalStateProvider>(context, listen: false);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    if (globalStateProvider.isLoading) return;

    globalStateProvider.setLoading(true);

    if (_saveLogin && email.isNotEmpty && password.isNotEmpty) {
      try {
        await loginProvider.login(
          email: email,
          password: password,
        );

        // await accountProvider.getAccount(loginProvider.loginModel.account.id);

        showSuccessToast(context, message: "Login Efetuado com sucesso!");
        globalStateProvider.setLoading(false);
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/home",
          (route) => false,
        );
        return;
      } catch (e) {
        globalStateProvider.setLoading(false);
        Logger.log("App::Auto Login Error $e");
      }
    } else {
      globalStateProvider.setLoading(false);
      Logger.log("App::Auto Login Not Found");

      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   "/onboarding",
      //   (route) => false,
      // );
      // return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppResponsive(
      mobile: const OnboardingMobile(),
    );
  }
}
