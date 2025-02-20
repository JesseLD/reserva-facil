// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/common/providers/global_state_provider.dart';
import 'package:reservafacil_partners/common/utils/logger.dart';
import 'package:reservafacil_partners/common/utils/toasts.dart';
import 'package:reservafacil_partners/common/widgets/app_responsive.dart';
import 'package:reservafacil_partners/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_partners/features/onboarding/presentation/widgets/onboarding_desktop.dart';
import 'package:reservafacil_partners/features/onboarding/presentation/widgets/onboarding_mobile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return AppResponsive(
      mobile: const OnboardingDesktop(),
    );
  }
}
