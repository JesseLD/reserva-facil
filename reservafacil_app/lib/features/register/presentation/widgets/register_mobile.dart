import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/constants/app_button_styles.dart';
import 'package:reservafacil_app/common/constants/app_images.dart';
import 'package:reservafacil_app/common/constants/app_input_styles.dart';
import 'package:reservafacil_app/common/utils/popups.dart';
import 'package:reservafacil_app/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_app/features/register/logic/providers/register_provider.dart';

class RegisterMobile extends StatefulWidget {
  RegisterMobile({super.key});

  @override
  State<RegisterMobile> createState() => _RegisterMobileState();
}

class _RegisterMobileState extends State<RegisterMobile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);

    TextEditingController _cpfController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();
    final _emailController = TextEditingController();
    final _nameController = TextEditingController();

    bool _obscureText = true;


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
                    "Crie sua conta",
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
                  label: const Text("Nome completo"),
                  hintText: "Digite seu nome completo",
                ),
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Por favor, digite seu nome';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: AppInputStyles.primaryInputVariation.copyWith(
                  label: const Text("E-mail "),
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
                  label: const Text("CPF"),
                  hintText: "Digite seu CPF",
                ),
                keyboardType: TextInputType.number,
                controller: _cpfController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite seu CPF';
                  }
                  if (value.replaceAll(RegExp(r'[^\d]'), '').length < 10) {
                    return 'O CPF Deve ter 11 dígitos';
                  }
                  return null;
                },
                onChanged: (value) {
                  if (value.replaceAll(RegExp(r'[^\d]'), '').length > 10) {
                    bool result = CPFValidator.isValid(value);

                    if (!result) {
                      _cpfController.clear();
                      return showErrorPopup(
                        context,
                        message:
                            "CPF inválido ou já cadastrado. Verifique os dados e tente novamente. Se o Seu CPF estiver correto, entre em contato conosco.",
                      );
                    }
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: AppInputStyles.primaryInputVariation.copyWith(
                  label: const Text("Nova Senha"),
                  hintText: "Digite sua senha",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
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
                height: 24,
              ),
              TextFormField(
                decoration: AppInputStyles.primaryInputVariation.copyWith(
                  label: const Text("Confirmar Senha"),
                  hintText: "Confirme sua senha",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                obscureText: _obscureText,
                controller: _confirmPasswordController,
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
                  if (value != _passwordController.text) {
                    return 'As senhas não são iguais';
                  }
                  return null;
                },
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
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Processando...'),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Criar Conta",
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
                  final loginProvider =
                      Provider.of<LoginProvider>(context, listen: false);
                  if (registerProvider.cameFromLogin) {
                    registerProvider.cameFromLogin = false;
                    Navigator.pop(context);
                  } else {
                    loginProvider.cameFromRegister = true;
                    Navigator.pushNamed(context, '/login');
                  }
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Já tem uma conta? ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "Faça login",
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
