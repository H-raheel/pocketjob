import 'package:flutter/material.dart';
import 'package:pocketjob/utils/texts.dart';

class ProfileOption extends StatelessWidget {
  String option;
  Icon icon;
  ProfileOption({
    required this.option,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      leading: icon,
      tileColor: Theme.of(context).colorScheme.tertiary,
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(
        option,
        style: blue_subheading(),
      ),
    );
  }
}
