abstract class StringValidator {
  String isValid(String value);
}

class EmailStringValidator extends StringValidator {
  @override
  String isValid(String mail) {
    if (mail.isEmpty) return 'Email must not be empty';

    RegExp regExp = new RegExp(
      r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$',
      caseSensitive: false,
    );
    if (regExp.hasMatch(mail)) return '';

    return 'Email is not valid';
  }
}

class PasswordStringValidator extends StringValidator {
  @override
  String isValid(String password) {
    if (password.isEmpty) return 'Password must not be empty';

    RegExp regExp = new RegExp(r'\W+', caseSensitive: false);
    if (regExp.hasMatch(password))
      return 'Password must has no special characters.';

    regExp = new RegExp(r'^\w{6,}$', caseSensitive: false);
    if (regExp.hasMatch(password)) return '';

    return 'Password must be at least 6 characters';
  }
}

class AccountValidator {
  final EmailStringValidator email = EmailStringValidator();
  final PasswordStringValidator password = PasswordStringValidator();
  final errs = {
    'email': 'Email must not be empty',
    'password': 'Password must not be empty',
  };

  void emailValidate(String email) {
    errs['email'] = this.email.isValid(email);
  }

  void passwordValidate(String password) {
    errs['password'] = this.password.isValid(password);
  }
}
