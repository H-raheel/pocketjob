import 'package:flutter/material.dart';

TextStyle heading() => const TextStyle(
    fontFamily: 'SourceSansPro', fontWeight: FontWeight.bold, fontSize: 22);

TextStyle heading2() => const TextStyle(
    fontFamily: 'SourceSansPro', fontWeight: FontWeight.bold, fontSize: 18);
TextStyle heading3() => const TextStyle(
    fontFamily: 'sourceSansPro', fontWeight: FontWeight.bold, fontSize: 30);
TextStyle subheading() {
  return const TextStyle(
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 85, 84, 84),
      fontSize: 12);
}

TextStyle subheading2() {
  return const TextStyle(
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 165, 164, 164),
      fontSize: 15);
}

TextStyle blue_subheading() {
  return const TextStyle(
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 29, 26, 215),
      fontSize: 15);
}

TextStyle body() {
  return const TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 12,
      color: Color.fromARGB(255, 163, 160, 160));
}

TextStyle body2() {
  return const TextStyle(
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color.fromARGB(255, 128, 127, 127));
}

TextStyle company_name() {
  return const TextStyle(
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.w500,
      fontSize: 11,
      color: Color.fromARGB(255, 128, 127, 127));
}

TextStyle body3() {
  return const TextStyle(
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 85, 84, 84),
      fontSize: 18);
}

TextStyle salaryDisplayFont() {
  return const TextStyle(
      fontFamily: 'SourceSansPro',
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 29, 26, 215),
      fontSize: 18);
}

TextStyle splashText() {
  return const TextStyle(
    fontFamily: 'SourceSansPro',
    color: Colors.white,
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );
}
