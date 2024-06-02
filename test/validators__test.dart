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
    File file = new File('file.txt');
    String? result = validateNonEmpty(file);
    expect(result, null);
  });
}
//validateNonEmpty