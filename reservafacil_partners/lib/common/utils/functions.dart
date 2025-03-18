
/// Clean the number by removing all non-digit characters.
String cleanNumber(String value) {
  return value.replaceAll(RegExp(r'\D'), '');
}