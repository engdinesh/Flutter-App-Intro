class Validator {

  // Email Validator
  static bool isEmailValid(String email) {
    String emailValidationRule =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailValidationRule);
    return regExp.hasMatch(email);
  }

  // Password Validator
  static bool isPasswordValid(String password) {
    String passwordValidationRule = r'((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,10})';
    RegExp regExp = new RegExp(passwordValidationRule);
    return regExp.hasMatch(password);
  }
}