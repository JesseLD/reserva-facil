import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/constants/app_button_styles.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_images.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';
import 'package:reservafacil_app/core/version/version_provider.dart';
import 'package:reservafacil_app/features/splash/presentation/pages/splash_page.dart';

class OnboardingMobile extends StatefulWidget {
  const OnboardingMobile({super.key});

  @override
  State<OnboardingMobile> createState() => _OnboardingMobileState();
}

class _OnboardingMobileState extends State<OnboardingMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.food),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
              ),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => SplashPage()));
                },
                child: Image.asset(
                  AppImages.logoMidUpW,
                  width: 240,
                ),
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: AppButtonStyles.primaryButtonStyle,
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              "Sou Cliente",
                              style: AppTextStyles.button.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: AppButtonStyles.secondaryButtonStyle,
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: Text(
                              "Criar Conta",
                              style: AppTextStyles.button.copyWith(
                                color: AppColors.primaryAlternative,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // Text()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
