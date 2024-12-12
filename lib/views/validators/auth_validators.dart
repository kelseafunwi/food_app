String emailValidators(value) {
  if (value.isEmpty) {
    return "Email cannot be empty";
  } else {
    return value;
  }
}

String passwordValidator(value) {
  if (value.isEmpty) {
    return "Password cannot be empty";
  } else {
    return value;
  }
}
