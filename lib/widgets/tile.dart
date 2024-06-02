import 'package:flutter/material.dart';
import 'package:pocketjob/utils/texts.dart';

class DisplayCard extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String sub;

  const DisplayCard(
      {super.key,
      required this.icon,
      required this.heading,
      required this.sub});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 226, 226, 226)),
        ),
        padding: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.45,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            SizedBox(width: 6),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    style: subheading(),
                  ),
                  Text(
                    sub,
                    style: blue_subheading(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
