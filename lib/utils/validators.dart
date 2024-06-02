import 'dart:io';

RegExp pakistanPhoneNumberRegExp = RegExp(r'^\+92\d{10}$');
RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
RegExp regex = RegExp(r'^[a-zA-Z]+$');
RegExp yearRegex = RegExp(r'^\d{4}$');
String? validateString(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field cannot be empty';
  }

  if (!regex.hasMatch(value.replaceAll(" ", ""))) {
    return 'Please enter only letters';
  }
  return null;
}

noValidation(String? value) {
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }
  if (!pakistanPhoneNumberRegExp.hasMatch(value)) {
    return 'Please follow the format: +92XXXXXXXXXX';
  }
  return null;
}

String? validatePhoneNumberSyntax(String? value) {
  if (value == "") return null;
  if (value != null) {
    if (!pakistanPhoneNumberRegExp.hasMatch(value)) {
      return 'Please follow the format: +92XXXXXXXXXX';
    }
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
  print("heeeeeeee");
  print(value);
  if (value == null) {
    return 'This field cannot be empty';
  }
  return null;
}

String? validateNonEmptyField(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field cannot be empty';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email address is required';
  }

  if (!emailRegExp.hasMatch(value)) {
    return 'Please follow the format: example@example.com';
  }
  return null;
}

String? validateYear(String? value) {
  if (value == null || value.isEmpty) {
    return null; // Return null if the input is null or empty
  }

  // Regex to match a four-digit number
  final regex = yearRegex;

  if (!regex.hasMatch(value)) {
    return 'Invalid year format';
  }

  final year = int.tryParse(value);

  if (year == null) {
    return 'Invalid year format';
  }

  if (year < 1990 || year > 2028) {
    return 'Year must be between 1990 and 2028';
  }

  return null;
}
