import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_app/common/constants/app_button_styles.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';
import 'package:reservafacil_app/common/constants/app_input_styles.dart';
import 'package:reservafacil_app/common/constants/app_text_styles.dart';
import 'package:reservafacil_app/common/utils/popups.dart';
import 'package:reservafacil_app/features/login/logic/providers/recover_password_provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureText = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecoverPasswordProvider>(context);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Recuperação de senha",
                style: AppTextStyles.subtitle.copyWith(
                  color: AppColors.primaryAlternative,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Digite sua nova senha, ela deve ter no mínimo 6 caracteres, com letras e números",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
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
                height: 16,
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
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: AppButtonStyles.primaryButtonStyle,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text('Processando...'),
                          //   ),
                          // );
                          showMessagePopup(context,
                              message: "Senha redefinida com sucesso",
                              onPressed: () {
                            provider.reset();
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: const Text(
                        "Redefinir Senha",
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
            ],
          ),
        ),
      ),
    );
  }
}
