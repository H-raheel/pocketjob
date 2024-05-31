import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/providers/authProvider.dart';
import 'package:pocketjob/providers/handleAppliedJobs.dart';
import 'package:pocketjob/providers/savedhandle2.dart';
import 'package:pocketjob/providers/userRepoprovider.dart';
import 'package:pocketjob/repo/authentication.dart';
import 'package:pocketjob/screens/signup.dart';
import 'package:pocketjob/utils/colors.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/utils/validators.dart';
import 'package:pocketjob/widgets/bottom_navigation.dart';
import 'package:pocketjob/widgets/buttons.dart';
import 'package:pocketjob/widgets/field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends ConsumerWidget {
  SignIn({super.key});

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future<void> sharedPreference(WidgetRef ref) async {
    final storage = await SharedPreferences.getInstance();
    storage.setBool("isLogin", true);
    List<String> appliedJobs = await ref
        .read(userRepositoryProvider)
        .getAppliedJobs(ref.read(authProvider).getUserId()!);
    storage.setStringList("appliedJobs", appliedJobs);
    List<String> savedJobs = await ref
        .read(userRepositoryProvider)
        .getSavedJobs(ref.read(authProvider).getUserId()!);
    storage.setStringList("savedJobs", savedJobs);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                            await AuthRepo().signInwithGoogle();
                            await ref
                                .read(jobApplicationsProvider.notifier)
                                .getjobs();
                            await ref
                                .read(handleSavedJobsProvider.notifier)
                                .getjobs();
                            // await sharedPreference(ref);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BottomNav()));
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
