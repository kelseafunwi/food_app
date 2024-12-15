String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String passwordValidator(value) {
  if (value.isEmpty) {
    return "Password cannot be empty";
  } else {
    return value;
  }
}

String usernameValidator(value) {
  if (value.isEmpty) {
    return "Username cannot be empty";
  } else {
    return value;
  }
}
