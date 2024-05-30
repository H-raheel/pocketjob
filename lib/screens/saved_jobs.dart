import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/screens/job_info.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/job_listing_card.dart';

import '../providers/streams/bookmarkedprovider.dart';

class SavedJobs extends ConsumerWidget {
  final List<JobListing> jobs = jobsList;
  SavedJobs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataNotifier = ref.watch(bookmarkedProvider);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        //elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: Back(),
        centerTitle: true,
        title: Text(
          "Bookmarked",
          style: heading(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  color: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.only(top: 6, right: 6, left: 6),
                  child: switch (dataNotifier) {
                    AsyncData(:final value) => value.isEmpty
                        ? Container(
                            child: Text("CREATE A WIDGET TO DISPLAY NO DATA"))
                        : ListView.separated(
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              List<JobListing> jobs = value;
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => JobInfoScreen(
                                                jobDetails: jobs[index])));
                                  },
                                  child: (JobListingCard(
                                    job: jobs[index],
                                    showLocation: false,
                                    applied: false,
                                  )));
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                          ),
                    AsyncError(:final error) => Center(
                        child:
                            Text("MAKE WIDGET FOR ERROR" + error.toString())),
                    AsyncLoading() =>
                      Center(child: CircularProgressIndicator()),
                    _ => Center(child: Text("default")),
                  }

                  // StreamBuilder<List<JobListing>>(
                  //     stream: userRepo()
                  //         .getSavedJobsStream(AuthService().getUserId()!),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         List<JobListing> jobs = snapshot.data!;
                  //         return ListView.separated(
                  //             itemBuilder: (context, index) {
                  //               return GestureDetector(
                  //                   onTap: () {
                  //                     Navigator.push(
                  //                         context,
                  //                         MaterialPageRoute(
                  //                             builder: (context) => JobInfoScreen(
                  //                                 jobDetails: jobs[index])));
                  //                   },
                  //                   child: (JobListingCard(
                  //                     job: jobs[index],
                  //                     showLocation: false,
                  //                     applied: false,
                  //                   )));
                  //             },
                  //             separatorBuilder: (context, index) =>
                  //                 const SizedBox(
                  //                   height: 10,
                  //                 ),
                  //             itemCount: jobs.length);
                  //       } else if (snapshot.hasError) {
                  //         return Center(
                  //           child: Text(snapshot.error.toString()),
                  //         );
                  //       } else if (snapshot.data == []) {
                  //         return Center(
                  //           child: Text("No saved jobs"),
                  //         );
                  //       } else {
                  //         return Center(
                  //           child: const CircularProgressIndicator(),
                  //         );
                  //       } // return ListView.builder(
                  //     }
                  //     ),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
