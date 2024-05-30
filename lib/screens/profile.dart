import 'package:flutter/material.dart';
import 'package:pocketjob/repo/authentication.dart';
import 'package:pocketjob/screens/signup.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
      onPressed: () async {
        // Navigate back to the first screen by popping the current route
        await AuthRepo().signOut();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignUp()));
      },
      child: const Text('Go back!'),
    ));
  }
}
