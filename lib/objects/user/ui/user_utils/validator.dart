class Validator{
  static String? validateEmail(String email) {
    bool emailValid = RegExp(r"[a-zA-Z0-9_-]+@[a-z]+\.[a-z]").hasMatch(email);
    if (email.isEmpty) {
      return "this field is required";
    } else if (!emailValid || email.contains(" ")) {
      return "email not valid";
    }
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "this field is required";
    } else if (password.length < 6) {
      return "password length must be 6 or more";
    }
  }

  static String? validateName(String name) {
    if (name.isEmpty) {
      return "this field is required";
    } else if (name.length < 1) {
      return "name can't less than two letters";
    }
  }
}