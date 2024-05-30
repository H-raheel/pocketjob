import 'package:flutter/material.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/screens/job_info.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/job_listing_card.dart';

class AppliedJobs extends StatelessWidget {
  final List<JobListing> jobs = jobsList;
  AppliedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: Back(),
        centerTitle: true,
        title: Text(
          "Applied",
          style: heading(),
        ),
      ),
      body: SafeArea(
        //  height: MediaQuery.of(context).size.height,

        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.secondary,
                padding: EdgeInsets.only(top: 6, right: 6, left: 6),
                child: ListView.separated(
                    itemBuilder: (context, index) {
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
                            applied: true,
                          )));
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: jobs.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
