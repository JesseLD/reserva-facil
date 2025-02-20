import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/constants/app_button_styles.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:reservafacil_partners/common/constants/app_images.dart';
import 'package:reservafacil_partners/common/constants/app_text_styles.dart';

class OnboardingDesktop extends StatefulWidget {
  const OnboardingDesktop({super.key});

  @override
  State<OnboardingDesktop> createState() => _OnboardingDesktopState();
}

class _OnboardingDesktopState extends State<OnboardingDesktop> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.darkGray,
              image: const DecorationImage(
                image: AssetImage(AppImages.accessRestaurant),
                fit: BoxFit.cover,
                opacity: 0.8,
              ),
            ),
            child: Center(
              child: Image.asset(AppImages.logoMidUpW),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Container(
                height: 400,
                width: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 16,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bem-Vindo ao\nReserva Fácil Parceiros",
                        style: AppTextStyles.title.copyWith(
                          color: AppColors.darkGray,
                          height: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Ao continuar, você concorda em receber comunicações do Reserva Fácil.",
                        style: AppTextStyles.bodyAlt.copyWith(
                          color: AppColors.lightGray,
                          height: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: AppButtonStyles.primaryButtonStyle,
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Text(
                                "Cadastrar",
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
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                "Entrar no Portal",
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
            ),
          ),
        ),
      ],
    );
  }
}
