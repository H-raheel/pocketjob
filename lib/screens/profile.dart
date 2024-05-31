import 'package:flutter/material.dart';
import 'package:pocketjob/screens/signup.dart';
import 'package:pocketjob/utils/colors.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/back.dart';

import '../repo/authentication.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        scrolledUnderElevation: 0,

        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: Back(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () async {
              await AuthRepo().signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
          ),
        ],
        // title: Text(
        //   "Bookmarked",
        //   style: heading(),
        // ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 6, right: 6, top: 16),
        child: Container(
          child: Column(
            children: [
              ListTile(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                leading: Icon(Icons.person_2_rounded),
                tileColor: Theme.of(context).colorScheme.tertiary,
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text(
                  "Add Skills",
                  style: blue_subheading(),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                leading: Icon(Icons.help),
                tileColor: Theme.of(context).colorScheme.tertiary,
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text(
                  "Need any help?",
                  style: blue_subheading(),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                leading: Icon(Icons.info),
                trailing: Icon(Icons.arrow_forward_ios),
                tileColor: Theme.of(context).colorScheme.tertiary,
                title: Text(
                  "Visit our website",
                  style: blue_subheading(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
