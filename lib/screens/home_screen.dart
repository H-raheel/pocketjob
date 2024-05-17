import 'package:flutter/material.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/screens/job_info.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/widgets/job_listing_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<JobListing> jobs = jobsList;

  @override
  Widget build(BuildContext context) {
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
          child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TestScreen(jobDetails: jobs[index])));
                    },
                    child: (JobListingCard(
                      job: jobs[index],
                      showLocation: true,
                      applied: false,
                    )));
              }),
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
                    fontSize: 25,
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
