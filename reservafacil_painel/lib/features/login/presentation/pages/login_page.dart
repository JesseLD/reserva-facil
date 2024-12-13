import 'package:flutter/material.dart';
import 'package:reservafacil_painel/core/shared/app_images.dart';
import 'package:reservafacil_painel/theme/custom_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: Center(
        child: Form(
          child: Container(
            width: width > 767 ? 500 : 275,
            height: width > 767 ? 500 : 400,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: CustomColors.lightOrange,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AppImages.logo_center,
                  width: width > 767 ? 200 : 160,
                ),
                SizedBox(height: width > 767 ? 20 : 12),
                Text(
                  "Painel Gestor",
                  style: TextStyle(
                    fontSize: 24,
                    color: CustomColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: width > 767 ? 32 : 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      focusColor: CustomColors.lightOrange,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: CustomColors.lightOrange,
                            style: BorderStyle.solid,
                            width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomColors.lightOrange,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomColors.lightOrange,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: width > 767 ? 20 : 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Senha",
                      focusColor: CustomColors.lightOrange,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: CustomColors.lightOrange,
                            style: BorderStyle.solid,
                            width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomColors.lightOrange,
                          style: BorderStyle.solid,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: CustomColors.lightOrange,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: width > 767 ? 40 : 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.lightOrange,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/home");
                          },
                          child: const Text(
                            "Entrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
