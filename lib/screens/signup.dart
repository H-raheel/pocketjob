import 'package:flutter/material.dart';
import 'package:pocketjob/constants/constants.dart';
import 'package:pocketjob/screens/signin.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/bottom_navigation.dart';
import 'package:pocketjob/widgets/buttons.dart';
import 'package:pocketjob/widgets/field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: formPadding,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create Account",
                          style: heading3(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Fill your information below or\n register with your social account",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: body(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Field(context, "Email", "example@gmail.com"),
                    SizedBox(
                      height: 20,
                    ),
                    Field(context, "Phone Number", "XXXX-XXXXXXX"),
                    SizedBox(
                      height: 20,
                    ),
                    Field(context, "Password", ""),
                    SizedBox(height: 22),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: primaryButton("Sign Up", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNav()));
                        })),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: subheading(),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
                            },
                            child: Text("Sign In", style: blue_subheading()))
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
