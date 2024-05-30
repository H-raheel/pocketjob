import 'dart:io';

RegExp pakistanPhoneNumberRegExp = RegExp(r'^\+92\d{10}$');
RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
RegExp regex = RegExp(r'^[a-zA-Z]+$');

String? validateString(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field cannot be empty';
  }

  if (!regex.hasMatch(value)) {
    return 'Please enter only letters';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }
  if (!pakistanPhoneNumberRegExp.hasMatch(value)) {
    return 'Please enter a valid  phone number in the following format +92XXXXXXXXXX';
  }
  return null;
}

String? validatePasswordsMatch(String? value, String confirm) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (value != confirm) {
    return 'Passwords do not match';
  }
  return null;
}

String? validateNonEmpty(File? value) {

  print(value);
  if (value == null) {
    return 'This field cannot be empty';
  }
  return null;
}

String? validateNonEmptyField(String? value) {
  if (value == null) {
    return 'This field cannot be empty';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email address is required';
  }

  if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email address in the format example@example.com';
  }
  return null;
}
