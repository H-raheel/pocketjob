import 'package:flutter/material.dart';
import 'package:pocketjob/constants/constants.dart';
import 'package:pocketjob/screens/home_screen.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/buttons.dart';
import 'package:pocketjob/widgets/field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: Back(),
        centerTitle: true,
        title: Text(
          "Apply for Job",
          style: heading(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: formPadding,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Field(context, "Full Name", ""),
                  SizedBox(
                    height: 20,
                  ),
                  Field(context, "Email", ""),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(height: 22),
                  Field(context, "Phone Number", ""),
                  SizedBox(
                    height: 20,
                  ),
                  Field(context, "Currently Employed", ""),
                  SizedBox(
                    height: 20,
                  ),
                  Field(context, "Currently Employed", ""),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: primaryButton("Done", () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => HomeScreen()));
                      })),
                ]),
          ),
        ),
      ),
    );
  }
}
