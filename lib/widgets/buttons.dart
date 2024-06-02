import 'package:flutter/material.dart';

ElevatedButton primaryButton(String message, function()) {
  return ElevatedButton(
    onPressed: function,
    child: Text(
      message,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 29, 26, 215),
    ),
  );
}

ElevatedButton secondaryButton(String message, function()) {
  return ElevatedButton(
      onPressed: function,
      child: Text(
        message,
        style: const TextStyle(
            color: Color.fromARGB(255, 29, 26, 215),
            fontWeight: FontWeight.w600,
            fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white));
}
