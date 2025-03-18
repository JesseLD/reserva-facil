import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservafacil_partners/features/login/logic/providers/recover_password_provider.dart';
import 'package:reservafacil_partners/features/login/presentation/widgets/recover_password_steps/confirm_code.dart';
import 'package:reservafacil_partners/features/login/presentation/widgets/recover_password_steps/reset_password.dart';
import 'package:reservafacil_partners/features/login/presentation/widgets/recover_password_steps/send_email.dart';

class RecoverPasswordMobile extends StatefulWidget {
  const RecoverPasswordMobile({super.key});

  @override
  State<RecoverPasswordMobile> createState() => _RecoverPasswordMobileState();
}

class _RecoverPasswordMobileState extends State<RecoverPasswordMobile> {
  int index = 0;

  List<Widget> steps = [
    const SendEmail(),
    const ConfirmCode(),
    const ResetPassword(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecoverPasswordProvider>(context);
    return steps[provider.index];
  }
}
