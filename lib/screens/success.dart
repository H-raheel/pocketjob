import 'package:flutter/material.dart';
import 'package:pocketjob/screens/applied.dart';
import 'package:pocketjob/screens/home_screen.dart';
import 'package:pocketjob/utils/colors.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/buttons.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        //  backgroundColor: ,
        body: SafeArea(
            child: Stack(
          children: [
            // Container(
            //   padding: EdgeInsets.all(16),
            //   color: Color(0xFFFDFDFD),
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   child: Column(
            //     children: [
            //       Back(),
            //     ],
            //   ),
            // ),
            //),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 212, 212, 212)),
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: primaryButton("Go to Applications", () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AppliedJobs()));
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: primaryButton("Go to Home", () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }),
                        ),
                      ]),
                )),

            Positioned(
                left: 0,
                right: 0,
                //  top: MediaQuery.of(context).size.height * 0.3,
                bottom: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: MediaQuery.of(context).size.width * 0.2,
                      child: Icon(
                        Icons.check_rounded,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width * 0.25,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "CONGRATULATIONS!",
                      style: heading(),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Your Application has been successfully sent!",
                      style: subheading(),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "You can check your application progress in Applied.",
                      style: subheading(),
                      textAlign: TextAlign.center,
                    )
                  ],
                ))
          ],
        )));
  }
}
