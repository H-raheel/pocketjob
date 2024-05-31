import 'package:flutter/material.dart';
import 'package:pocketjob/screens/signup.dart';
import 'package:pocketjob/services/authentication.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/alert.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:url_launcher/url_launcher.dart';

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
              await AuthServ().signOut();
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
                leading: Icon(Icons.pie_chart_outline_outlined),
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
              GestureDetector(
                onTap: () async {
                  final Uri emailUri =
                      Uri(scheme: 'mailto', path: 'h.raheel622@gmail.com');
                  if (await canLaunchUrl(emailUri)) {
                    try {
                      await launchUrl(emailUri);
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const Alert(
                              message: 'Some unexpected error occurred.');
                        },
                      );
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const Alert(
                            message: 'Some unexpected error occurred.');
                      },
                    );
                  }
                },
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  leading: Icon(Icons.mail),
                  tileColor: Theme.of(context).colorScheme.tertiary,
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text(
                    "Contact Help Center",
                    style: blue_subheading(),
                  ),
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
                  "Privacy Policy",
                  style: blue_subheading(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
