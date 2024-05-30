import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/streams/displayJobs.dart';
import 'package:pocketjob/screens/job_info.dart';
import 'package:pocketjob/utils/colors.dart';
import 'package:pocketjob/widgets/job_listing_card.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataNotifier = ref.watch(displayProvider);
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).colorScheme.secondary,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.22,
                right: 16,
                left: 16),
            child: switch (dataNotifier) {
              AsyncData(:final value) => value == []
                  ? Center(child: Text("no data"))
                  : ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
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
                              showLocation: true,
                              applied: false,
                            )));
                      }),
              AsyncError(:final error) =>
                Center(child: Text("error.try again ")),
              AsyncLoading() => Center(child: CircularProgressIndicator()),
              _ => Center(child: Text("default")),
            }

            //  StreamBuilder<List<JobListing>>(
            //     stream: jobsRepo().getJobsStream(),
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         jobs = snapshot.data!;
            //         return ListView.separated(
            //             separatorBuilder: (context, index) => const SizedBox(
            //                   height: 10,
            //                 ),
            //             itemCount: jobs.length,
            //             itemBuilder: (context, index) {
            //               print(jobs);
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
            //                     showLocation: true,
            //                     applied: false,
            //                   )));
            //             });
            //       } else if (snapshot.hasError) {
            //         return Center(
            //           child: Text(snapshot.error.toString()),
            //         );
            //       } else {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }
            //     }),
            ),
        Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, Humera!!",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              TextField(
                  decoration: InputDecoration(
                contentPadding: EdgeInsets.all(12),
                hintText: "Search",
                hintStyle: TextStyle(fontSize: 17, color: Colors.grey),
                filled: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: mainColor,
                  size: 30,
                ),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              )),
            ],
          ),
        ),
      ],
    )));
  }
}
