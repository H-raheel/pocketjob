import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/appliedJobsHandler.dart';
import 'package:pocketjob/screens/apply.dart';
import 'package:pocketjob/utils/helperfunctions.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/alert.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/button/primmarybutton.dart';
import 'package:pocketjob/widgets/tile.dart';
import 'package:readmore/readmore.dart';

class JobInfoScreen extends ConsumerWidget {
  final JobListing jobDetails;
  // final List<JobListing> jobs = jobsList;
  JobInfoScreen({
    super.key,
    required this.jobDetails,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  
    bool applied =
        ref.read(jobApplicationsProvider.notifier).isIdPresent(jobDetails.id!);

    return Scaffold(
        appBar: AppBar(
         
          backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: Back(
            context: context,
          ),
        ),
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                 
                  color: Theme.of(context).colorScheme.secondary),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.07,
                      bottom: MediaQuery.of(context).size.height * 0.1,
                      right: 6,
                      left: 6),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          jobDetails.title,
                          style: heading(),
                        ),
                        Text(
                          jobDetails.company,
                          style: subheading(),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.pin_drop,
                                size: 30,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              Text(
                                jobDetails.city! + " , " + jobDetails.country,
                                style: subheading(),
                              ),
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DisplayCard(
                                icon: Icons.money,
                                heading: "Salary(Monthly)",
                                sub:
                                    formatNumber(jobDetails.salary.toString())),
                            DisplayCard(
                                icon: Icons.business_center,
                                heading: "Job Type",
                                sub: jobDetails.type[0]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DisplayCard(
                                icon: Icons.apartment,
                                heading: "Working Mode",
                                sub: jobDetails.type[1]),
                            DisplayCard(
                                icon: Icons.bar_chart,
                                heading: "Level",
                                sub: jobDetails.type[2]),
                          ],
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "About Company",
                                style: heading2(),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                trimString(jobDetails.companyInfo),
                                style: body(),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Job Description",
                                style: heading2(),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              ReadMoreText(
                                bulletSentences(jobDetails.description),
                                style: body(),
                                colorClickableText:
                                    Theme.of(context).colorScheme.primary,
                                trimCollapsedText: 'more',
                                trimExpandedText: '.show less',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
              bottom: 0,
              child: Container(
                  padding:const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 212, 212, 212)),
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  //        child: Consumer(builder: (context, ref, child) {

                  child: Container(
                    child: PrimaryButton(
                        message: "Apply for Job",
                        function: () async {
                          !applied
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Apply(
                                            jobId: jobDetails.id!,
                                          )))
                              : showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const Warning(
                                        message:
                                            'You have already applied for this job. Please wait patiently for the response.');
                                  },
                                );
                        }),
                  )
                  //         }
                  ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.75,
              right: 0,
              left: 0,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: NetworkImage(
                      jobDetails.imageUrl,
                    ))),
              ),
            ),
          ],
        )));
  }
}
