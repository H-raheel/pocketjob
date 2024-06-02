import 'dart:io';

import 'package:pocketjob/utils/validators.dart';
import 'package:test/test.dart';

void main() {
  test('test email validator-empty field', () {
    String? result = validateEmail('');
    expect(result, 'Email address is required');
  });

  test('test email validator', () {
    String? result = validateEmail('abc@@');
    expect(result, 'Please follow the format: example@example.com');
  });

  test('test password validator-case of empty field', () {
    String? result = validatePasswordsMatch('', 'abcdefg');
    expect(result, 'Please enter a password');
  });

  test('test password matching validator-case of matched fields', () {
    String? result = validatePasswordsMatch('abcdefg', 'abcdefg');
    expect(result, null);
  });

  test('test password validator-case of unmatched values', () {
    String? result = validatePasswordsMatch('abcdefg', 'abcdef');
    expect(result, 'Passwords do not match');
  });

  test('File attached validator-no file attached', () {
    String? result = validateNonEmpty(null);
    expect(result, 'This field cannot be empty');
  });

  test('File attached validator-no file attached', () {
    File file = File('file.txt');
    String? result = validateNonEmpty(file);
    expect(result, null);
  });

  test('test validatePhoneNumberSyntax-should return null', () {
    expect(validatePhoneNumberSyntax(''), null);
    expect(validatePhoneNumberSyntax(null), null);
    expect(validatePhoneNumberSyntax('+923456789012'), null);
    expect(validatePhoneNumberSyntax('03456789012'),
        'Please follow the format: +92XXXXXXXXXX');
    expect(validatePhoneNumberSyntax('+92345678901a'),
        'Please follow the format: +92XXXXXXXXXX');
  });

  test('test validatePhoneNumberSyntax-should return error', () {
    expect(validatePhoneNumberSyntax('03456789012'),
        'Please follow the format: +92XXXXXXXXXX');
    expect(validatePhoneNumberSyntax('+92345678901a'),
        'Please follow the format: +92XXXXXXXXXX');
  });

  test('test validateNonEmptyField', () {
    expect(validateNonEmptyField(''), 'This field cannot be empty');
    expect(validateNonEmptyField(null), 'This field cannot be empty');
    expect(validateNonEmptyField('abc'), null);
  });

  test('test validateYear', () {
    expect(validateYear(''), null);
    expect(validateYear(null), null);
    expect(validateYear('abcd'), 'Invalid year format');
    expect(validateYear('1700'), 'Year must be between 1990 and 2028');
    expect(validateYear('2029'), 'Year must be between 1990 and 2028');
    expect(validateYear('2024'), null);
  });
}
