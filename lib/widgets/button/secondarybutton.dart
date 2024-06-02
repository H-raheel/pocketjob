import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String message;
  final VoidCallback function;

  const SecondaryButton({
    Key? key,
    required this.message,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(
        message,
        style: const TextStyle(
          color: Color.fromARGB(255, 29, 26, 215),
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
    );
  }
}
