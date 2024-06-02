import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/features/authentication/presentation/signInController.dart';
import 'package:pocketjob/screens/updateProfile.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/alert.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/buttons.dart';
import 'package:pocketjob/widgets/optionstile.dart';
import 'package:pocketjob/widgets/progressLoader.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(authControllerProvider);
    // ref.listen<AsyncValue<void>>(
    //   authControllerProvider,
    //   (_, state) => state.whenOrNull(
    //     error: (error, stackTrace) {
    //       print("SHHHHOOWNG" + error.toString().replaceAll("Exception: ", ""));
    //       showDialog(
    //           context: context,
    //           builder: (context) => Warning(
    //               message: error.toString().replaceAll("Exception: ", "")));
    //     },
    //   ),
    // );

    return state.isLoading
        ? Scaffold(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            body: const WaitingForProgressLoader())
        : Scaffold(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              leading: Back(context: context),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.2,
                            padding: EdgeInsets.all(6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Are you sure you want to log out?",
                                    style: body3()),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: primaryButton(
                                          "Log Out",
                                          () => ref
                                              .read(authControllerProvider
                                                  .notifier)
                                              .signOut(context)),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: secondaryButton("Cancel",
                                          () => Navigator.pop(context)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                    //   ref.read(authControllerProvider.notifier).signOut(context);
                  },
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 6, right: 6, top: 16),
              child: Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Editprofile()),
                      ),
                      child: ProfileOption(
                        option: "Profile",
                        icon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Editprofile()),
                      ),
                      child: ProfileOption(
                        option: "Add Skills",
                        icon: Icon(Icons.pie_chart_rounded),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final Uri emailUri = Uri(
                            scheme: 'mailto', path: 'h.raheel622@gmail.com');
                        if (await canLaunchUrl(emailUri)) {
                          try {
                            await launchUrl(emailUri);
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const Warning(
                                    message: 'Some unexpected error occurred.');
                              },
                            );
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const Warning(
                                  message: 'Some unexpected error occurred.');
                            },
                          );
                        }
                      },
                      child: ProfileOption(
                        option: "Contact Us",
                        icon: Icon(Icons.contact_mail),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProfileOption(
                        option: "Privacy policy",
                        icon: Icon(Icons.info_rounded)),
                  ],
                ),
              ),
            ),
          );
  }
}
