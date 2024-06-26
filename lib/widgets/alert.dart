import 'package:flutter/material.dart';
import 'package:pocketjob/utils/texts.dart';

class Warning extends StatelessWidget {
  final String message;
  const Warning({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      title: Icon(
        Icons.error,
        color: Theme.of(context).colorScheme.primary,
      ),
      content: Text(
        message,
        style: subheading2(),
      ),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Cancel',
            style: blue_subheading(),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Closes the dialog
          },
        ),
      ],
    );
  }
}
