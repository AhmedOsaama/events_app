// import 'package:easy_localization/easy_localization.dart';

class Validator {
  static String? defaultValidator(String? value) {
    if (value != null && value.trim().isEmpty) {
      return "Message cannot be empty";
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value != null && (value.trim().isEmpty || value.trim().length < 4)) {
      print("NOT VALID");
      // return tr("error_field_required");
      return "Invalid phone number";
    }
    return null;
  }

  static String? text(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return "Field cannot be empty";
      }
    }
    return null;
  }


  static String? defaultEmptyValidator(String? value) {
    return null;
  }

  static String? email(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return "The email is required";
      } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return "Please enter a valid email address";
      }
    } else {
      return "Please enter a valid email address";
    }
    return null;
  }

  static String? password(String? value) {
    if (value != null) {
      value = value.trim();
      if (value.isEmpty) {
        return "Password is required";
      }
    } else {
      return "Password is required";
    }
    return null;
  }

  static String? confirmPassword(String? confirmPassword, String? password) {
    if (confirmPassword != null) {
      confirmPassword = confirmPassword.trim();
      if (confirmPassword.isEmpty) {
        return "Confirm password is required";
      } else if (confirmPassword != password) {
        return "Passwords do not match";
      }
    } else {
      return "Confirm password is required";
    }
    return null;
  }
}
