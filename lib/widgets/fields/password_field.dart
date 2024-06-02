import 'package:flutter/material.dart';
import 'package:pocketjob/utils/texts.dart';

class PasswordField extends StatefulWidget {
  final String label;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const PasswordField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hintText,
      required this.validator})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: heading2(),
        ),
        SizedBox(
          height: 12,
        ),
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: _passwordVisible,
          decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              focusColor: Theme.of(context).colorScheme.primary,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.all(10),
              hintText: widget.hintText,
              hintStyle: subheading2(),
              fillColor: Color.fromARGB(69, 212, 210, 210),
              filled: true,
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.primary,
                  size: 15,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
        ),
      ],
    );
  }
}