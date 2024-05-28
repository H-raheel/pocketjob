import 'package:flutter/material.dart';
import 'package:pocketjob/utils/colors.dart';

TextStyle heading() => TextStyle(fontWeight: FontWeight.bold, fontSize: 22);

TextStyle heading2() => TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
TextStyle heading3() => TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
TextStyle subheading() {
  return TextStyle(
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 85, 84, 84),
      fontSize: 12);
}

TextStyle subheading2() {
  return TextStyle(
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 165, 164, 164),
      fontSize: 15);
}

TextStyle blue_subheading() {
  return TextStyle(fontWeight: FontWeight.bold, color: mainColor, fontSize: 15);
}

TextStyle body() {
  return TextStyle(fontSize: 12, color: Color.fromARGB(255, 163, 160, 160));
}

TextStyle body2() {
  return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: const Color.fromARGB(255, 128, 127, 127));
}

TextStyle company_name() {
  return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      color: const Color.fromARGB(255, 128, 127, 127));
}

TextStyle body3() {
  return TextStyle(
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 85, 84, 84),
      fontSize: 18);
}

TextStyle salaryDisplayFont() {
  return TextStyle(fontWeight: FontWeight.bold, color: mainColor, fontSize: 18);
}
