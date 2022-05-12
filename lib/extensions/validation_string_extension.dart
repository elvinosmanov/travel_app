extension Validation on String {
  static const String noEmpty = 'This field can\'t be empty';
  static const String noSpace = 'Whitespace is not allowed';
  String? get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final s = this;
    if (s.isEmpty) {
      return noEmpty;
    } else if (s.contains(" ")) {
      return noSpace;
    }
    return emailRegExp.hasMatch(s) ? null : 'Enter valid email';
  }

  String? get isValidUsername {
    final usernameRegExp = RegExp(r"^(?=.{5,20}$)[a-zA-Z0-9]+$");
    final s = this;
    if (s.isEmpty) {
      return noEmpty;
    } else if (s.length < 5 || s.length >= 20) {
      return 'Username should be 5-20 characters long';
    }

    return usernameRegExp.hasMatch(s) ? null : 'Allowed characters: a-z A-Z 0-9';
  }

  String? get isValidFullName {
    final nameRegExp = RegExp(r"^[a-zA-Z]+\s[a-zA-Z]+$");
    final s = this;
    if (s.isEmpty) {
      return noEmpty;
    }
    return nameRegExp.hasMatch(s) ? null : 'Enter name and surname';
  }

  String? get isValidPassword {
    final passwordRegExp = RegExp(r'^((?!.*[\s])(?=.*\d).{5,15})');

    final s = this;
    if (s.isEmpty) {
      return noEmpty;
    }
    return passwordRegExp.hasMatch(s)
        ? null
        : 'Password must be at least 5 characters that include at least 1 character, 1 number and no whitespace';
  }

  String useCorrectEllipsis() {
    return replaceAll('', '\u200B');
  }
}
