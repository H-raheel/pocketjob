import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/appliedjobsprovider.dart';
import 'package:pocketjob/screens/job_info.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/bottom_navigation.dart';
import 'package:pocketjob/widgets/button/primmarybutton.dart';
import 'package:pocketjob/widgets/job_listing_card.dart';
import 'package:pocketjob/widgets/progressLoader.dart';

class AppliedJobs extends ConsumerWidget {
  const AppliedJobs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(appliedProvider);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: Back(
          context: context,
        ),
        centerTitle: true,
        title: Text(
          "Applied",
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
                  child: streamData.when(
                      data: (data) => (data.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "No Jobs Applied",
                                    style: heading(),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      child: PrimaryButton(
                                          message: "Find a Job",
                                          function: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BottomNav()));
                                          })),
                                ],
                              ),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                List<JobListing> jobs = data;
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  JobInfoScreen(
                                                      jobDetails:
                                                          jobs[index])));
                                    },
                                    child: (JobListingCard(
                                      job: jobs[index],
                                      showLocation: false,
                                      applied: true,
                                      //  ref: ref,
                                    )));
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                              itemCount: data.length,
                            )),
                      error: (error, StackTrace) => Center(child:Icon(Icons.error),),
                      loading: () => const WaitingForProgressLoader())),
            )
          ],
        ),
      ),
    );
  }
}
