/// Sanitize the input value to remove any special characters and return the sanitized value
/// e.g. sanitizeNumbers('123-456-7890') => '1234567890'
String sanitizeNumbers(String value){
  return value.replaceAll(RegExp(r'[^0-9]'), '');
}