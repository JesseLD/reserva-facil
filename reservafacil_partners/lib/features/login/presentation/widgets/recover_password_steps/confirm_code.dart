import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:reservafacil_partners/common/constants/app_text_styles.dart';
import 'package:reservafacil_partners/common/utils/logger.dart';
import 'package:reservafacil_partners/common/utils/toasts.dart';
import 'package:reservafacil_partners/features/login/logic/providers/recover_password_provider.dart';

class ConfirmCode extends StatefulWidget {
  const ConfirmCode({super.key});

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecoverPasswordProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
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
              const Text(
                "Digite o código de verificação enviado para o seu e-mail",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: AppColors.primaryAlternative,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                textStyle: AppTextStyles.button.copyWith(
                  color: AppColors.primaryAlternative,
                  fontSize: 28,
                ),
                fieldWidth: 50,

                //runs when a code is typed in
                focusedBorderColor: AppColors.primaryAlternative,
                onCodeChanged: (String code) {
                  // if (code.length == 6) {
                  //   // provider.nextStep();
                  //   Logger.log("object ${code}");
                  // }
                  //handle validation or checks here
                },
                keyboardType: TextInputType.number,

                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  Logger.log("Code $verificationCode");

                  final intCode = int.parse(verificationCode);

                  if (intCode == provider.code) {
                    provider.nextStep();
                  } else {
                    showErrorToast(context,
                        message: "Código inválido, tente novamente");
                  }
                }, // end onSubmit
              ),
              // const SizedBox(
              //   height: 24,
              // ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: ElevatedButton(
              //         style: AppButtonStyles.primaryButtonStyle,
              //         onPressed: () {
              //           if (_formKey.currentState!.validate()) {
              //             // ScaffoldMessenger.of(context).showSnackBar(
              //             //   const SnackBar(
              //             //     content: Text('Processando...'),
              //             //   ),
              //             // );
              //             // provider.nextStep();
              //           }
              //         },
              //         child: const Text(
              //           "Confirmar",
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
            ],
          ),
        ),
      ),
    );
  }
}
