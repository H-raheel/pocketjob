import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/bottom_navigation.dart';

class VerifiedScreen extends StatefulWidget {
  VerifiedScreen({super.key});

  @override
  State<VerifiedScreen> createState() => _VerifiedScreenState();
}

class _VerifiedScreenState extends State<VerifiedScreen> {
  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificatioEmail();
      timer = Timer.periodic(Duration(seconds: 3), (timer) {
        (_) => checkEmailVerified();
      });
    }
  }

  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future sendVerificatioEmail() async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? BottomNav()
        : Scaffold(
            appBar: AppBar(
              scrolledUnderElevation: 0,
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              leading: Back(),
              centerTitle: true,
              title: Text(
                "Verify Email",
                style: heading(),
              ),
            ),
            body: SafeArea(
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                padding: EdgeInsets.only(top: 16, left: 6, right: 6),
                child: Center(
                    child: Text(
                        "A confirmation mail has been sent to your email. Please verify your email to continue.")),
              ),
            ),
          );
  }
}
