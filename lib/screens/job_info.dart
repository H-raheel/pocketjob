import 'package:flutter/material.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/screens/apply.dart';
import 'package:pocketjob/utils/colors.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/tile.dart';
import 'package:readmore/readmore.dart';

import '../widgets/buttons.dart';

class JobInfoScreen extends StatelessWidget {
  final JobListing jobDetails;
  final List<JobListing> jobs = jobsList;
  JobInfoScreen({
    super.key,
    required this.jobDetails,
  });

  // TabController tabController=new TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: Back(),
          // centerTitle: true,
          // title: Text(
          //   "Applied",
          //   style: heading(),
          // ),
        ),
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondary),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.only(
              //         bottomLeft: Radius.circular(10),
              //         bottomRight: Radius.circular(10))),
              // child: Column(
              //   // mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     //  Back(),
              //     AppBar(
              //       scrolledUnderElevation: 0,
              //       elevation: 0,
              //       backgroundColor: Theme.of(context).colorScheme.secondary,
              //       leading: Back(),
              //       centerTitle: true,
              //     ),
              //   ],
              // )
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
                      borderRadius: BorderRadius.only(
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
                                color: mainColor,
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
                            c_Card(context, Icons.money, "Salary(Monthly)",
                                jobDetails.salary.toString()),
                            c_Card(context, Icons.business_center, "Job Type",
                                jobDetails.type[0]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            c_Card(context, Icons.apartment, "Working Mode",
                                jobDetails.type[1]),
                            c_Card(context, Icons.bar_chart, "Level",
                                jobDetails.type[2]),
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
                                jobDetails.companyInfo,
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
                                jobDetails.description,
                                trimLength: 200,
                                style: body(),
                                colorClickableText: mainColor,
                                trimCollapsedText: 'more',
                                trimExpandedText: 'show less',
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
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 212, 212, 212)),
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Container(
                    // height: 2,
                    // width: 2,
                    child: primaryButton("Apply for Job", () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Apply()));
                    }),
                  ),
                )),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.75,
              right: 0,
              left: 0,
              child: CircleAvatar(
                radius: 50,
                child: Image.network(
                  jobDetails.imageUrl,
                ),
              ),
            ),
          ],
        )));
  }
}
