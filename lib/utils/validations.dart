class Validations {
  static String? Function(String?)? email = (value) {
    if (value == null || value.isEmpty) {
      return 'Enter your email';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  };
  static String? Function(String?)? phone = (value) {
    if (value == null || value.isEmpty) {
      return 'Enter your phone number';
    }
    final phoneRegex = RegExp(r'^[0-9]{10}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  };
  static String? Function(String?)? name = (value) {
    if (value == null || value.isEmpty) {
      return 'Enter a name';
    }

    return null;
  };
  static String? Function(String?)? workExperience = (value) {
    if (value == null || value.isEmpty) {
      return 'Enter your years of experience';
    }
    if (int.tryParse(value) == null) {
      return 'Enter a valid number';
    }
    return null;
  };
  static String? Function(String?)? password = (value) {
    if (value == null || value.isEmpty) {
      return 'Enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  };
}
