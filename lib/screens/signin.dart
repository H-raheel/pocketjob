import 'package:flutter/material.dart';
import 'package:pocketjob/repo/authentication.dart';
import 'package:pocketjob/screens/signup.dart';
import 'package:pocketjob/utils/colors.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/utils/validators.dart';
import 'package:pocketjob/widgets/bottom_navigation.dart';
import 'package:pocketjob/widgets/buttons.dart';
import 'package:pocketjob/widgets/field.dart';

class SignIn extends StatefulWidget {
  final AuthService auth = AuthService();
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Image.asset('assets/images/logo.png')),
                    Text(
                      "Sign In",
                      style: heading3(),
                    ),
                    Text(
                      "Hi!Welcome back, youve been missed",
                      style: body(),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Field(
                      controller: emailController,
                      label: "Email",
                      hintText: "example@gmail.com",
                      validator: (value) => validateEmail(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Field(
                      controller: passwordController,
                      label: "Password",
                      hintText: "",
                      validator: (value) => validateNonEmptyField(value),
                    ),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: primaryButton("Sign In", () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNav()));
                            })),
                        GestureDetector(
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.height * 0.07,
                              child: Image.asset(
                                'assets/images/google.jpg',
                                fit: BoxFit.cover,
                              )),
                          onTap: () async {
                            await widget.auth.signInwithGoogle();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomNav()));
                          },
                        ),
                      ],
                    ),
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
