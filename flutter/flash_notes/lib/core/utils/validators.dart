import '../constants/app_regex.dart';

class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!AppRegex.email.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (!AppRegex.password.hasMatch(value)) {
      return 'Minimum 8 chars, letter & number';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (!AppRegex.name.hasMatch(value)) {
      return 'Enter a valid name';
    }
    return null;
  }
}
