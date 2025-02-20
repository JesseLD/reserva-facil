import 'package:flutter/material.dart';
import 'package:reservafacil_partners/common/constants/app_colors.dart';
import 'package:toastification/toastification.dart';

void showSuccessToast(
  BuildContext context, {
  required String message,
}) {
  toastification.show(
    context: context,
    title: Text(message),
    autoCloseDuration: const Duration(seconds: 3),
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    primaryColor: AppColors.successGreen,
  );
}

void showErrorToast(
  BuildContext context, {
  required String message,
}) {
  toastification.show(
    context: context,
    title: Text(message),
    autoCloseDuration: const Duration(seconds: 3),
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    primaryColor: AppColors.dangerRed,
  );
}
