import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/displayJobs.dart';
import 'package:pocketjob/providers/handleSavedJobs.dart';
import 'package:pocketjob/screens/job_info.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/job_listing_card.dart';

class SavedJobs extends ConsumerWidget {
  final List<JobListing> jobs = jobsList;
  SavedJobs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedJobs = ref.watch(handleSavedJobsProvider);
    print(savedJobs.toString() + "saved jobs FROMSAVEDD");
    final dataNotifier = ref.watch(displayProvider);
    // final savedJobs = ref.watch(jobsSavedProvider);
    //  print(savedJobs.toString() + "saved jobs");
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: Back(context: context,),
        centerTitle: true,
        title: Text(
          "Bookmarked",
          style: heading(),
        ),
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
              color: Theme.of(context).colorScheme.secondary,
              padding: EdgeInsets.only(top: 6, right: 6, left: 6),
              child: switch (dataNotifier) {
                AsyncData(:final value) => value.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "No Saved Jobs",
                              style: heading(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Icon(
                              Icons.bookmark_border,
                              size: 50,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      )
                    : Builder(builder: (context) {
                        List<JobListing> jobs = value;
                        List<JobListing> filteredList = jobs
                            .where((job) => savedJobs.contains(job.id))
                            .toList();
                        return filteredList.isNotEmpty
                            ? ListView.separated(
                                itemCount: filteredList.length,
                                itemBuilder: (context, index) {
                                  print(value.toString() + "value");
                                  print(filteredList.toString() + "filtered");
                                  print(savedJobs.toString() + "saved");
                                  return filteredList.isNotEmpty
                                      ? GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        JobInfoScreen(
                                                            jobDetails:
                                                                filteredList[
                                                                    index])));
                                          },
                                          child: (JobListingCard(
                                            job: filteredList[index],
                                            showLocation: false,
                                            applied: false,
                                            //  ref: ref,
                                          )))
                                      : Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "No Jobs Saved",
                                                style: heading(),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Icon(
                                                Icons.bookmark_border,
                                                size: 50,
                                                color: Colors.grey,
                                              )
                                            ],
                                          ),
                                        );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 10,
                                ),
                              )
                            : Center(
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "No Jobs Saved",
                                    style: heading(),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Icon(
                                    Icons.bookmark_border,
                                    size: 50,
                                    color: Colors.grey,
                                  )
                                ],
                              ));
                      }),
                AsyncError(:final error) => Center(
                    child: Text("MAKE WIDGET FOR ERROR" + error.toString())),
                AsyncLoading() => Center(child: CircularProgressIndicator()),
                _ => Center(child: Text("default")),
              }

              // StreamBuilder<List<JobListing>>(
              //     stream: userRepository()
              //         .getSavedJobsStream(AuthRepository().getUserId()!),
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
        ),
      ),
    );
  }
}
