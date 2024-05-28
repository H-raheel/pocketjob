import 'package:flutter/material.dart';
import 'package:pocketjob/constants/constants.dart';
import 'package:pocketjob/screens/signup.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/bottom_navigation.dart';
import 'package:pocketjob/widgets/buttons.dart';
import 'package:pocketjob/widgets/field.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                          "Sign In",
                          style: heading3(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hi!Welcome back, youve been missed",
                          style: body(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Field(context, "Email", "example@gmail.com"),
                    const SizedBox(
                      height: 20,
                    ),
                    Field(context, "Password", ""),
                    const SizedBox(height: 22),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: primaryButton("Sign In", () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNav()));
                        })),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont have an account?",
                          style: subheading(),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text("Sign Up", style: blue_subheading()))
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
