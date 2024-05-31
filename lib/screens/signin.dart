import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pocketjob/providers/controllers/signInController.dart';
import 'package:pocketjob/screens/signup.dart';
import 'package:pocketjob/utils/colors.dart';
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
              padding: formPadding,
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.5,
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
                    style: body(),
                  ),
                  const SizedBox(
                    height: 12,
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
      ),
    );
  }
}
