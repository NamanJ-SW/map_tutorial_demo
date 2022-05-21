class FieldValidator {
  String? fieldValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some data';
    } else {
      return null;
    }
  }

  String? emailValidate(String? value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.toString());
    if (value == null || value.isEmpty) {
      return 'Please enter email address';
    } else if (!emailValid) {
      return 'Please enter valid email address';
    } else {
      return null;
    }
  }

  String? nameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter name';
    } else {
      return null;
    }
  }

  String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 6) {
      return 'The password must be at least 6 characters.';
    } else {
      return null;
    }
  }

  String? repeatPasswordValidate(String? value, String? repeatValue) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    } else {
      if (value != repeatValue) {
        return 'Password does not match';
      } else {
        return null;
      }
    }
  }
}
