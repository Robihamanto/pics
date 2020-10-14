class ValidationMixin {

  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please input valid email';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Password at leat 4 characters';
    }
    return null;
  }

}