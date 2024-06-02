import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocketjob/features/authentication/presentation/signInController.dart';
import 'package:pocketjob/features/authentication/presentation/signin.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/utils/validators.dart';
import 'package:pocketjob/widgets/alert.dart';
import 'package:pocketjob/widgets/button/primmarybutton.dart';

import 'package:pocketjob/widgets/fields/field.dart';
import 'package:pocketjob/widgets/fields/password_field.dart';

class SignUp extends StatefulWidget {
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
              padding: EdgeInsets.all(26),
              child: Form(
                key: _formKey,
                child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.06,
                      // ),
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
                      const SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: Consumer(builder: (context, ref, child) {
                            final AsyncValue<void> state =
                                ref.watch(authControllerProvider);
                            ref.listen<AsyncValue<void>>(
                              authControllerProvider,
                              (_, state) => state.whenOrNull(
                                error: (error, stackTrace) {
                                  print("SHHHHOOWNG" +
                                      error
                                          .toString()
                                          .replaceAll("Exception: ", ""));
                                  showDialog(
                                      context: context,
                                      builder: (context) => Warning(
                                          message: error
                                              .toString()
                                              .replaceAll("Exception: ", "")));
                                },
                              ),
                            );
                            return state.isLoading
                                ? SpinKitThreeBounce(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 10)
                                : PrimaryButton(message:"Sign Up",function: () async {
                                    if (_formKey.currentState!.validate()) {
                                      ref
                                          .read(authControllerProvider.notifier)
                                          .signUpWithIdPassword(
                                              context,
                                              emailController.text,
                                              passwordController.text,
                                              nameController.text);
                                      // Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             BottomNav()));
                                    }
                                  });
                          })),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: subheading2(),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignIn(),
                                    ),
                                  );
                                },
                              text: "Log In!",
                              style: blue_subheading(),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
