import 'package:flutter/material.dart';
import 'package:pocketjob/utils/colors.dart';
import 'package:pocketjob/utils/texts.dart';

Card c_Card(BuildContext context, IconData icon, String heading, String sub) {
  return Card(
    elevation: 0,
    // clipBehavior: Clip.antiAlias,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 226, 226, 226))),
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.45,
      // color: Colors.white,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(
                icon,
                color: mainColor,
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
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
