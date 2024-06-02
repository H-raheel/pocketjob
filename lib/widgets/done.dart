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
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Closes the dialog
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.grey,
                    )),
              ],
            ),
            Icon(
              Icons.done_rounded,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
            Text(
              message,
              style: body2(),
            ),
          ],
        ),
      ),
    );
  }
}
