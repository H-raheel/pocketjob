import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocketjob/features/authentication/presentation/signInController.dart';
import 'package:pocketjob/features/authentication/presentation/signup.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/utils/validators.dart';
import 'package:pocketjob/widgets/alert.dart';
import 'package:pocketjob/widgets/buttons.dart';
import 'package:pocketjob/widgets/field.dart';

class SignIn extends ConsumerWidget {
  SignIn({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(26),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fill,
                      )),
                  Text(
                    "Sign In",
                    style: heading3(),
                  ),
                  Text(
                    "Hi!Welcome back, youve been missed",
                    style: body2(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Field(
                    controller: _emailController,
                    label: "Email",
                    hintText: "example@gmail.com",
                    validator: (value) => validateEmail(value),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordField(
                    controller: _passwordController,
                    label: "Password",
                    hintText: "",
                    validator: (value) => validateNonEmptyField(value),
                  ),
                  const SizedBox(height: 22),
                  Consumer(
                    builder: (context, ref, child) {
                      final AsyncValue<void> state =
                          ref.watch(authControllerProvider);
                      ref.listen<AsyncValue<void>>(
                        authControllerProvider,
                        (_, state) => state.whenOrNull(
                          error: (error, stackTrace) {
                            print("SHHHHOOWNG" +
                                error.toString().replaceAll("Exception: ", ""));
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
                              color: Theme.of(context).colorScheme.primary,
                              size: 10)
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.07,
                                    child: primaryButton("Sign In", () {
                                      if (_formKey.currentState!.validate()) {
                                        ref
                                            .read(
                                                authControllerProvider.notifier)
                                            .login(
                                                context,
                                                _emailController.text,
                                                _passwordController.text);
                                      }
                                    })),
                                GestureDetector(
                                  child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      child: Image.asset(
                                        'assets/images/google.jpg',
                                        fit: BoxFit.fill,
                                      )),
                                  onTap: () async {
                                    print("heeeeee");

                                    ref
                                        .read(authControllerProvider.notifier)
                                        .signInWithGoogle(context);
                                  },
                                ),
                              ],
                            );
                    },
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: subheading2(),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                          text: "Register Now!",
                          style: blue_subheading(),
                        ),
                      ],
                    ),
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "Dont have an account?",
                  //       style: subheading2(),
                  //     ),
                  //     TextButton(
                  //         onPressed: () {
                  //           Navigator.pushReplacement(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => SignUp()));
                  //         },
                  //         child:
                  //             Text("Register Now!", style: blue_subheading()))
                  //   ],
                  // )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
