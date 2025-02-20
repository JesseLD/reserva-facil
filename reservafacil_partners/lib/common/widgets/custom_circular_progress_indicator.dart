import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive(
      backgroundColor: AppColors.primaryAlternative,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
