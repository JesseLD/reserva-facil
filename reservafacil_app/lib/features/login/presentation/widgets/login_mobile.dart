// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:reservafacil_app/common/constants/app_button_styles.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_images.dart';
import 'package:reservafacil_app/common/constants/app_input_styles.dart';
import 'package:reservafacil_app/common/utils/logger.dart';
import 'package:reservafacil_app/common/utils/popups.dart';
import 'package:reservafacil_app/common/utils/toasts.dart';
import 'package:reservafacil_app/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_app/features/register/logic/providers/register_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginMobile extends StatefulWidget {
  bool cameFromRegister;
  LoginMobile({
    super.key,
    this.cameFromRegister = false,
  });

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  final _formKey = GlobalKey<FormState>();

  bool _saveLogin = false;
  bool _obscureText = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() async {
    final prefs = await SharedPreferences.getInstance();

    if (_saveLogin) {
      prefs.setString("email", _emailController.text);
      prefs.setString("password", _passwordController.text);
    } else {
      prefs.remove("email");
      prefs.remove("password");
    }

    String? localEmail = prefs.getString("email");
    String? localPassword = prefs.getString("password");

    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    if (localEmail != null && localPassword != null && _saveLogin) {
      try {
        await loginProvider.login(
          email: localEmail,
          password: localPassword,
        );

        showSuccessToast(context, message: "Login Efetuado com sucesso!");

        Navigator.pushNamedAndRemoveUntil(
          context,
          "/home",
          (route) => false,
        );
      } catch (e) {
        Logger.log("Auto Login Error $e");
      }
    }

    try {
      await loginProvider.login(
        email: _emailController.text,
        password: _passwordController.text,
      );

      showSuccessToast(context, message: "Login Efetuado com sucesso!");

      Navigator.pushNamedAndRemoveUntil(
        context,
        "/home",
        (route) => false,
      );
    } catch (e) {
      Logger.log("Login Error $e");

      // showErrorToast(context, message: "Erro ao fazer login");

      if (e.toString().contains("UserNotFoundException")) {
        showErrorPopup(
          context,
          message: "Usuário não encontrado!",
          title: "Erro ao realizar o login",
        );
      } else if (e.toString().contains("InvalidPasswordException")) {
        showErrorPopup(
          context,
          message: "Email ou Senha Inválidos, Tente Novamente",
          title: "Erro ao realizar o login",
        );
      }
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(e.toString()),
      //   ),
      // );
    }
  }

  void _loadSaveLogin() async {
    final prefs = await SharedPreferences.getInstance();

    _saveLogin = prefs.getBool("saveLogin") ?? false;
  }

  @override
  void initState() {
    _loadSaveLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Form(
      key: _formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logoMidUp,
                width: 200,
              ),
              const SizedBox(
                height: 32,
              ),
              const Row(
                children: [
                  Text(
                    "Entre na sua conta",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: AppInputStyles.primaryInputVariation.copyWith(
                  label: const Text("E-mail"),
                  hintText: "Digite seu e-mail",
                ),
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu e-mail';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Por favor, digite um e-mail válido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: AppInputStyles.primaryInputVariation.copyWith(
                  label: const Text("Senha"),
                  hintText: "Sua Senha",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();

                      prefs.setBool("saveLogin", _obscureText);

                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                controller: _passwordController,
                obscureText: _obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite sua senha';
                  }
                  if (value.length < 6) {
                    return 'Sua senha deve ter no mínimo 6 caracteres';
                  }
                  if (!value.contains(RegExp(r'[0-9]'))) {
                    return 'Sua senha deve conter números';
                  }

                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _saveLogin = !_saveLogin;
                          });
                        },
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black26,
                              width: 1.2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 12,
                            color: _saveLogin ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "Salvar Login",
                        style: TextStyle(
                          color: Color(0xFFFF6900),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/recover-password');
                    },
                    child: const Text(
                      "Recuperar Senha",
                      style: TextStyle(
                        color: Color(0xFFFF6900),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: AppButtonStyles.primaryButtonStyle,
                      onPressed: () {
                        if (loginProvider.isLoading) return;
                        if (_formKey.currentState!.validate()) {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text('Processando...'),
                          //   ),
                          // );

                          _handleLogin();
                        }
                      },
                      child: loginProvider.isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator.adaptive(
                                // value: ,
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.primary,
                                ),
                              ),
                            )
                          : const Text(
                              "Entrar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Ou",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  final registerProvider =
                      Provider.of<RegisterProvider>(context, listen: false);

                  if (loginProvider.cameFromRegister) {
                    registerProvider.cameFromLogin = false;
                    Navigator.pop(context);
                  } else {
                    registerProvider.cameFromLogin = true;

                    Navigator.pushNamed(context, '/register');
                  }
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Não tem uma conta? ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "Cadastre-se",
                        style: TextStyle(
                          color: Color(0xFFFF6900),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
