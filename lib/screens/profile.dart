import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/providers/controllers/signInController.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/alert.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/progressLoader.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<void> state = ref.watch(authControllerProvider);
    ref.listen<AsyncValue<void>>(
      authControllerProvider,
      (_, state) => state.whenOrNull(
        error: (error, stackTrace) {
          print("SHHHHOOWNG" + error.toString().replaceAll("Exception: ", ""));
          showDialog(
              context: context,
              builder: (context) => Warning(
                  message: error.toString().replaceAll("Exception: ", "")));
        },
      ),
    );

    return state.isLoading
        ? Scaffold(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            body: const WaitingForProgressLoader())
        : Scaffold(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              leading: const Back(),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () async {
                    ref.read(authControllerProvider.notifier).signOut(context);
                  },
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 6, right: 6, top: 16),
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      leading: Icon(Icons.pie_chart),
                      tileColor: Theme.of(context).colorScheme.tertiary,
                      trailing: Icon(Icons.arrow_forward_ios),
                      title: Text(
                        "Add Skills",
                        style: blue_subheading(),
                      ),
                    ),
                    SizedBox(
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
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        leading: Icon(Icons.mail),
                        tileColor: Theme.of(context).colorScheme.tertiary,
                        trailing: Icon(Icons.arrow_forward_ios),
                        title: Text(
                          "Contact Help Center",
                          style: blue_subheading(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      leading: Icon(Icons.info),
                      trailing: Icon(Icons.arrow_forward_ios),
                      tileColor: Theme.of(context).colorScheme.tertiary,
                      title: Text(
                        "Privacy Policy",
                        style: blue_subheading(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
