import 'package:flutter/material.dart';
import 'package:pocketjob/utils/texts.dart';

class Done extends StatelessWidget {
  final String message;
  const Done({
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
      content: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Closes the dialog
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Colors.grey,
                    )),
              ],
            ),
            Icon(
              Icons.done_rounded,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              message,
              style: subheading2(),
            ),
          ],
        ),
      ),
    );
  }
}
