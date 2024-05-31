import 'package:flutter/material.dart';

import 'package:pocketjob/screens/signin.dart';
import 'package:pocketjob/services/authentication.dart';
import 'package:pocketjob/utils/colors.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/utils/validators.dart';
import 'package:pocketjob/widgets/bottom_navigation.dart';
import 'package:pocketjob/widgets/buttons.dart';
import 'package:pocketjob/widgets/field.dart';

class SignUp extends StatefulWidget {
  final AuthServ auth = AuthServ();
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: formPadding,
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Image.asset('assets/images/logo.png')),
                      Text(
                        "Create Account",
                        style: heading3(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Fill your information below or\n register with your social account",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: body(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Field(
                        controller: nameController,
                        label: "Name",
                        hintText: "Ayesha",
                        validator: (value) => validateString(value),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Field(
                        controller: emailController,
                        label: "Email",
                        hintText: "example@gmail.com",
                        validator: (value) => validateEmail(value),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PasswordField(
                          controller: passwordController,
                          label: "Password",
                          hintText: "",
                          validator: (value) => validateNonEmptyField(value)),
                      SizedBox(height: 10),
                      PasswordField(
                          controller: confirmPasswordController,
                          label: "Confirm Password",
                          hintText: "",
                          validator: (value) => validatePasswordsMatch(
                              value, passwordController.text)),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: primaryButton("Sign Up", () async {
                            if (_formKey.currentState!.validate()) {
                              print("validatedd");
                              await widget.auth.signUp(emailController.text,
                                  passwordController.text, nameController.text);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNav()));
                            }
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => BottomNav()));
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
                                Navigator.pushReplacement(
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
      ),
    );
  }
}
