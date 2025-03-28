class CpfConverter {
  /// Converts a CPF to a Formatted CPF.
  /// Formats on Format "XXX.XXX.XXX-XX"
  static String format(String cpf) {
    cpf = cpf.replaceAll(RegExp(r'\D'), '');
    if (cpf.length > 11) {
      cpf = cpf.substring(0, 11);
    }

    if (cpf.length < 11) {
      cpf = cpf.padLeft(11, '0');
    }

    String formattedCpf = '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}';

    return formattedCpf;
  }
}
