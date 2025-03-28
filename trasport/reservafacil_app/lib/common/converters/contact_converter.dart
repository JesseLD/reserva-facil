class ContactConverter {
  /// Formats Contact in format "XX XXXXX-XXXX"
  static String format(String contact) {
    contact = contact.replaceAll(RegExp(r'\D'), '');

    if (contact.length > 11) {
      contact = contact.substring(0, 11);
    }

    if (contact.length < 11) {
      contact = contact.padLeft(11, '0');
    }

    String formattedContact = '(${contact.substring(0, 2)}) ${contact.substring(2, 7)}-${contact.substring(7)}';

    return formattedContact;
  }
}
