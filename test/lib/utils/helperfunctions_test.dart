import 'package:pocketjob/utils/helperfunctions.dart';
import 'package:test/test.dart';


void main() {
  test('test trimString1', () {

    expect(trimString('   '), '');
    
  });
  test('test trimString2', () {
    expect(trimString('  hello  '), 'hello');
  
  });
  test('test trimString3', () {
    
    expect(trimString('abc'), 'abc');
  });

  test('test bulletSentences', () {
    final paragraph = 'This is a sentence. This is another sentence.  ';
    final expectedOutput = '• This is a sentence\n• This is another sentence';
    expect(bulletSentences(paragraph), expectedOutput);
  });

  test('test formatNumber1', () {
    expect(formatNumber('12000'), '12,000');
   
  });

    test('test formatNumber2', () {
   
    expect(formatNumber('1234567'), '1,234,567');
  });
   test('test formatNumber3', () {
 
    expect(formatNumber('560000'), '560,000');
    
  });
}
