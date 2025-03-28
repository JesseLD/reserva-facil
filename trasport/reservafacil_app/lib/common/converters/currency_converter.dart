import 'package:intl/intl.dart';

class CurrencyConverter {
  /// Converts a double to a String in the format 'R$ 0.00,00'
  static String fromDouble(double value) {
    final format = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return format.format(value);
  }

  /// Converts a String in the format 'R$ 0.00,00' to a double
  static double fromString(String value) {
    final format = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return format.parse(value.replaceAll('R\$', '').trim()).toDouble();
  }
}
