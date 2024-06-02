
import 'package:flutter/material.dart';
import 'package:pocketjob/utils/texts.dart';

class Field extends StatelessWidget {
  final String label;
  final String hintText;
  bool defaultVal = true;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  Field(
      {Key? key,
      this.defaultVal = true,
      required this.controller,
      required this.label,
      required this.hintText,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: heading2(),
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          enabled: defaultVal,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              focusColor: Theme.of(context).colorScheme.primary,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: subheading2(),
              fillColor: Color.fromARGB(69, 212, 210, 210),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
        ),
      ],
    );
  }
}
