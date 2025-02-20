// ignore_for_file: use_build_context_synchronously

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/common/constants/app_images.dart';
import 'package:reservafacil_partners/common/constants/app_input_styles.dart';
import 'package:reservafacil_partners/common/providers/global_state_provider.dart';
import 'package:reservafacil_partners/common/utils/popups.dart';
import 'package:reservafacil_partners/common/utils/toasts.dart';
import 'package:reservafacil_partners/common/widgets/button/reactive_button.dart';
import 'package:reservafacil_partners/features/login/logic/providers/login_provider.dart';
import 'package:reservafacil_partners/features/register/data/models/register_model.dart';
import 'package:reservafacil_partners/features/register/logic/providers/register_provider.dart';

class RegisterMobile extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  RegisterMobile({super.key});

  @override
  State<RegisterMobile> createState() => _RegisterMobileState();
}

class _RegisterMobileState extends State<RegisterMobile> {
  final _formKey = GlobalKey<FormState>();

  final _cpfController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  bool _obscureText = true;
  void _handleRegister() async {
    final globalStateProvider =
        Provider.of<GlobalStateProvider>(context, listen: false);
    if (globalStateProvider.isLoading) return;

    globalStateProvider.setLoading(true);

    final registerProvider =
        Provider.of<RegisterProvider>(context, listen: false);
    // final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    RegisterModel registerModel = RegisterModel(
      name: _nameController.text,
      email: _emailController.text,
      cpfCnpj: _cpfController.text.replaceAll(RegExp(r'[.\-]'), ""),
      password: _passwordController.text,
    );

    try {
      await registerProvider.register(registerModel, context);

      showSuccessToast(context,
          message:
              "Um e-mail de confirmação foi enviado para ${_emailController.text}. Verifique sua caixa de entrada e siga as instruções para ativar sua conta.");

      _nameController.clear();
      _emailController.clear();
      _cpfController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      globalStateProvider.setLoading(false);
      Navigator.pushNamed(context, '/login');
    } catch (e) {
      globalStateProvider.setLoading(false);
      if (e.toString().contains("UserAlreadyExistsException")) {
        showErrorPopup(
          context,
          message:
              "O E-mail ou CPF informado já está cadastrado. Tente fazer login ou recuperar sua senha.",
          title: "Erro ao realizar o registro",
        );
      } else {
        showErrorPopup(
          context,
          message: "Erro ao realizar o registro. Tente novamente!",
          title: "Erro ao realizar o registro",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);

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
                  label: const Text("Sua Senha"),
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
              // Row(
              //   children: [
              //     Expanded(
              //       child: ElevatedButton(
              //         style: AppButtonStyles.primaryButtonStyle,
              //         onPressed: () async {
              //           if (_formKey.currentState!.validate()) {
              //             // ScaffoldMessenger.of(context).showSnackBar(
              //             //   const SnackBar(
              //             //     content: Text('Processando...'),
              //             //   ),
              //             // );
              //             _handleRegister();
              //           }
              //         },
              //         child: registerProvider.isLoading
              //             ? const SizedBox(
              //                 width: 24,
              //                 height: 24,
              //                 child: CircularProgressIndicator.adaptive(
              //                   // value: ,
              //                   backgroundColor: Colors.white,
              //                   valueColor: AlwaysStoppedAnimation<Color>(
              //                     AppColors.primary,
              //                   ),
              //                 ),
              //               )
              //             : const Text(
              //                 "Criar Conta",
              // style: TextStyle(
              //   color: Colors.white,
              //   fontSize: 16,
              //   fontWeight: FontWeight.bold,
              // ),
              //               ),
              //       ),
              //     ),
              //   ],
              // ),
              ReactiveButton(
                  child: const Text(
                    "Criar Conta",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _handleRegister();
                    }
                  }),
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
