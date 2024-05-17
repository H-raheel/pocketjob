import 'package:flutter/material.dart';
import 'package:pocketjob/constants/constants.dart';
import 'package:pocketjob/screens/success.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/buttons.dart';
import 'package:pocketjob/widgets/field.dart';

class Apply extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            //  height: MediaQuery.of(context).size.height,
            color: Theme.of(context).colorScheme.secondary,
            padding: EdgeInsets.only(top: 16, left: 6, right: 6),
            child: Column(
              children: [
                AppBar(
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
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(top: 20, right: 6, left: 6),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: formPadding,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Text(
                            //       "Sign In",
                            //       style: heading3(),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                            Field(context, "Full Name", ""),
                            SizedBox(
                              height: 20,
                            ),
                            Field(context, "Email", ""),
                            SizedBox(
                              height: 20,
                            ),
                            AttachPDFField(
                                context, "Upload CV/Resume", "Browse file"),
                            SizedBox(height: 22),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: primaryButton("Submit", () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Success()));
                                })),
                          ]),
                    ),
                  ),
                ))
              ],
            )),
      ),
    );
  }
}
