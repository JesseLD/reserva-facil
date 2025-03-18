// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:reservafacil_partners/common/constants/app_input_styles.dart';
import 'package:reservafacil_partners/common/constants/app_text_styles.dart';
import 'package:reservafacil_partners/common/providers/global_state_provider.dart';
import 'package:reservafacil_partners/common/utils/toasts.dart';
import 'package:reservafacil_partners/common/widgets/button/reactive_button.dart';
import 'package:reservafacil_partners/features/login/logic/providers/recover_password_provider.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({super.key});

  @override
  State<SendEmail> createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecoverPasswordProvider>(context);
    final globalStateProvider =
        Provider.of<GlobalStateProvider>(context, listen: false);

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
              const Text("Digite seu e-mail para recuperar sua senha"),
              const SizedBox(
                height: 24,
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
              // Row(
              //   children: [
              //     Expanded(
              //       child: ElevatedButton(
              //         style: AppButtonStyles.primaryButtonStyle,
              //         onPressed: () async {

              //         },
              //         child: const Text(
              //           "Enviar",
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 16,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              ReactiveButton(
                child: const Text(
                  "Enviar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    globalStateProvider.setLoading(true);
                    try {
                      await provider.recoverPassword(
                        email: _emailController.text,
                      );
                      provider.email = _emailController.text;
                      showSuccessToast(context,
                          message: "E-mail enviado com sucesso!");
                      globalStateProvider.setLoading(false);
                      provider.nextStep();
                    } catch (e) {
                      globalStateProvider.setLoading(false);

                      showErrorToast(context,
                          message: "Erro, Usuário não encontrado");
                    }

                    // showSuccessToast(context, message: message)
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
