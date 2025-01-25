import 'package:intl/intl.dart';

class DateConverter {
  /// Converts a String in the format 'yyyy-MM-dd' to a DateTime
  static DateTime fromString(String date) {
    return DateTime.parse(date);
  }

  /// Converts a String in the format 'dd/MM/yyyy' to a DateTime
  static DateTime fromRawString(String date) {
    return  DateFormat('dd/MM/yyyy').parse(date);
  }

  /// Converts a DateTime to a String in the format 'dd/MM/yyyy'
  static String toFormattedString(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
           '${date.month.toString().padLeft(2, '0')}/'
           '${date.year}';
  }
}
