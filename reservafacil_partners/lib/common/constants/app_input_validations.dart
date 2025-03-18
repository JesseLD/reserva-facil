import 'package:brasil_fields/brasil_fields.dart';
import 'package:reservafacil_partners/common/utils/sanitizer.dart';

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo obrigatório';
  }
  if (value.length < 3) {
    return 'Campo deve ter no mínimo 3 caracteres';
  }
  return null;
}


String? validateGenericText(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo obrigatório';
  }
  if (value.length < 3) {
    return 'Campo deve ter no mínimo 3 caracteres';
  }
  return null;
}
String? validateGenericNumber(String? value) {
  if (value == null || value.isEmpty || value.toString() == '0') {
    return 'Campo obrigatório';
  }

}


String? validateCpfCnpj(String? value) {
  if (value == null || value.isEmpty) {
    return 'Campo obrigatório';
  }
  final cleanInput = sanitizeNumbers(value);
  if (cleanInput.length < 11 || cleanInput.length > 14) {
    return 'CPF/CNPJ inválido';
  }

  // if (cleanInput.length == 11) {
  //   if (!CPFValidator.isValid(cleanInput)) {
  //     return 'CPF inválido';
  //   }
  //   if (!CNPJValidator.isValid(cleanInput)) {
  //     return 'CPF inválido';
  //   }
  //   return null;
  // }

  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, digite seu e-mail';
  }
  if (!value.contains('@') || !value.contains('.')) {
    return 'Por favor, digite um e-mail válido';
  }
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'Por favor, digite um e-mail válido';
  }
  return null;
}

String? validateBirthDate(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, digite sua data de nascimento';
  }
  if (value.length < 10) {
    return 'Por favor, digite uma data de nascimento válida';
  }
  return null;
}

String? validatePhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira seu Telefone';
  }

  // Remove caracteres não numéricos
  String sanitizedValue = value.replaceAll(RegExp(r'\D'), '');

  // Verifica se o número tem o tamanho esperado (10 ou 11 dígitos)
  if (sanitizedValue.length != 11) {
    return 'Número de Telefone inválido, verifique o DDD e o 9';
  }

  // Verifica se o DDD é válido (ex: 11, 21, 31...)
  if (!RegExp(
          r'^(1[1-9]|2[12478]|3[1-5]|4[1-9]|5[1-5]|6[1-9]|7[1-9]|8[1-9]|9[1-9])')
      .hasMatch(sanitizedValue)) {
    return 'DDD inválido';
  }

  if (sanitizedValue[2] != '9') {
    return 'O número deve começar com 9 após o DDD';
  }

  // Verifica se todos os dígitos são iguais (ex: 0000000000, 1111111111)
  if (RegExp(r'^(\d)\1+$').hasMatch(sanitizedValue)) {
    return 'Número de Telefone inválido';
  }
  return null;
}

String? validateCEP(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, digite seu CEP';
  }
  final sanitizedValue = sanitizeNumbers(value);
  if (sanitizedValue.length < 8 || sanitizedValue.length > 9) {
    return 'Por favor, digite um CEP válido';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, digite sua senha';
  }
  if (value.length < 6) {
    return 'Sua senha deve ter no mínimo 6 caracteres';
  }
  if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Sua senha deve conter números';
  }
  if (!value.contains(RegExp(r'[a-z]'))) {
    return 'Sua senha deve conter letras minúsculas';
  }
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Sua senha deve conter letras maiúsculas';
  }
  return null;
}
