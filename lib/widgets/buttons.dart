import 'package:flutter/material.dart';

ElevatedButton primaryButton(String message, function()) {
  return ElevatedButton(
    onPressed: function,
    child: Text(
      message,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    ),
    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF2623D2)),
  );
}
