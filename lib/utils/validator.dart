class Validator {
  Validator._();
  static String? Function(String?) emailValidator() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your email';
      }
      return null;
    };
  }
}
