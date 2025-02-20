import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:reservafacil_partners/common/constants/app_images.dart';
import 'package:reservafacil_partners/common/providers/global_state_provider.dart';
import 'package:reservafacil_partners/common/utils/logger.dart';
import 'package:reservafacil_partners/common/utils/popups.dart';
import 'package:reservafacil_partners/common/utils/toasts.dart';
import 'package:reservafacil_partners/common/widgets/custom_circular_progress_indicator.dart';
import 'package:reservafacil_partners/core/config/logic/providers/config_provider.dart';
import 'package:reservafacil_partners/features/login/logic/providers/login_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String email = "";
  String password = "";

  bool _saveLogin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // if (mounted) {
      //   setState(() {});
      // }
      appSync();
    });
  }

  void appSync() async {
    await loadConfig();
    await _checkUpdates();
  }

  Future<void> loadConfig() async {
    final configProvider = Provider.of<ConfigProvider>(context, listen: false);
    await configProvider.getConfig();
  }

  Future<void> _checkUpdates() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final configProvider = Provider.of<ConfigProvider>(context, listen: false);

    final version = packageInfo.version;
    final buildNumber = packageInfo.buildNumber;

    if (version != configProvider.configModel.version ||
        buildNumber != configProvider.configModel.buildNumber.toString()) {
      Logger.log("Splash::Update Available");

      return await showUpdatePopupWebTEMP(context,
          currentVersion: "${version}b$buildNumber",
          newVersion:
              "${configProvider.configModel.version}b${configProvider.configModel.buildNumber}");
    } else {
      Logger.log("Splash::No Update Available");
      _handleAutoLogin();
    }
  }

  void _handleAutoLogin() async {
    await _loadSaveLogin();
    await _autoLogin();
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
        Logger.log("Splash::Auto Login Error $e");
      }
    } else {
      globalStateProvider.setLoading(false);
      Logger.log("Splash::Auto Login Not Found");

      Navigator.pushNamedAndRemoveUntil(
        context,
        "/onboarding",
        (route) => false,
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.primaryGradient,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logoMinW,
                width: 120,
              ),
              const SizedBox(height: 16),
              const Text(
                'Carregando...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              const CustomCircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
