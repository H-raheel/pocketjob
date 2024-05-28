import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.8,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey)),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24,
          ),
          color: Colors.black,
        ),
      ),
    );
  }
}
