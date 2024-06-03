import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/displayJobs.dart';
import 'package:pocketjob/providers/searchProvider.dart';
import 'package:pocketjob/providers/userProvider.dart';
import 'package:pocketjob/screens/job_info.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/job_listing_card.dart';
import 'package:pocketjob/widgets/progressLoader.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();

  void update(WidgetRef ref, String value) {
    ref.read(searchProvider.notifier).state = value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataNotifier = ref.watch(displayProvider);
    final searchControllerProvider = ref.watch(searchProvider);
    // final userData = ref.watch(CurrentUserProvider);

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
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.work_rounded,
                          size: 50,
                          color: Colors.grey,
                        ),
                        Text(
                          "No Jobs Available",
                          style: subheading(),
                        )
                      ],
                    ))
                  : Builder(builder: (context) {
                      List<JobListing> jobs = value;
                      List<JobListing> filteredList = jobs
                          .where((job) => (job.title.toLowerCase().contains(
                              searchControllerProvider.toLowerCase())))
                          .toList();

                      return filteredList.isEmpty
                          ? Center(
                              child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.work_rounded,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                                Text(
                                  "No Jobs Available",
                                  style: subheading(),
                                )
                              ],
                            ))
                          : ListView.builder(
                              itemCount: filteredList.length,
                              itemBuilder: (context, index) {
                                List<JobListing> jobs = filteredList;
                                JobListing current = jobs[index];
                                if (searchControllerProvider == "") {
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    JobInfoScreen(
                                                        jobDetails: current)));
                                      },
                                      child: (JobListingCard(
                                        job: current,
                                        showLocation: true,
                                        applied: false,
                                        // ref: ref,
                                      )));
                                } else if (current.title.toLowerCase().contains(
                                    searchControllerProvider.toLowerCase())) {
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    JobInfoScreen(
                                                        jobDetails: current)));
                                      },
                                      child: (JobListingCard(
                                        job: current,
                                        showLocation: true,
                                        applied: false,
                                        //  ref: ref,
                                      )));
                                } else {
                                  return null;
                                }
                              });
                    }),
              AsyncError(:final error) => Center(
                  child: const Icon(Icons.error),
                ),
              AsyncLoading() => (const WaitingForProgressLoader()),
              _ => const Center(child: Text("default")),
            }),
        Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, ${ref.read(CurrentUserProvider)?.name ?? 'User'}",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              TextField(
                  onChanged: (value) => update(ref, value),

                  ///   controller: searchController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    hintText: "Search",
                    hintStyle:
                        const TextStyle(fontSize: 17, color: Colors.grey),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.primary,
                      size: 30,
                    ),
                    fillColor: Colors.white,
                    enabledBorder: const OutlineInputBorder(
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
