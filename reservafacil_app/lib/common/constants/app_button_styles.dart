import 'package:flutter/material.dart';
import 'package:reservafacil_app/common/constants/app_colors.dart';

class AppButtonStyles {
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 12),
    elevation: 0,
    backgroundColor: AppColors.primaryAlternative,
    shape: RoundedRectangleBorder(
      borderRadius:
          BorderRadius.circular(8), // Corrigido: Não pode ser const aqui
    ),
  );

  static final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 12),
    elevation: 0,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        color: AppColors.primaryAlternative,
        width: 2,
      ),
      borderRadius:
          BorderRadius.circular(8), // Corrigido: Não pode ser const aqui
    ),
  );

  // Adicionando outro estilo para botões de texto, caso necessário
  static final ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.orange, // Cor do texto
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  // Adicionando estilo para ElevatedButton desabilitado
  static final ButtonStyle disabledButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.grey[400],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
