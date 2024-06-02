import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/savedJobsHandler.dart';
import 'package:pocketjob/utils/helperfunctions.dart';
import 'package:pocketjob/utils/texts.dart';

class JobListingCard extends ConsumerWidget {
  final JobListing job;
  final bool showLocation;
  final bool applied;
  // final WidgetRef ref;
  const JobListingCard({
    super.key,
    required this.job,
    required this.showLocation,
    required this.applied,
    //   required this.ref
  });

  @override
  Widget build(BuildContext context, ref) {
    //  final savedJobListIds = ref.watch(bookmarkedJobsProvider);
    final savedJobs = ref.watch(handleSavedJobsProvider);
    print(savedJobs.toString() + "saved jobs in card");
    return Card(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        width: MediaQuery.of(context).size.width * 0.75,
        height: showLocation
            ? MediaQuery.of(context).size.height * 0.3
            : MediaQuery.of(context).size.height * 0.28,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            applied
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Chip(
                        labelPadding: EdgeInsets.zero,
                        label: Text("Applied"),
                      )
                    ],
                  )
                : Container(),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: NetworkImage(job.imageUrl),
                            fit: BoxFit.cover)),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.title,
                        style: heading2(),
                        // maxLines: 2,
                      ),
                      Text(job.company, style: company_name()),
                    ],
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () async {
                        ref
                            .read(handleSavedJobsProvider.notifier)
                            .update(job.id!);
                      },
                      icon: Icon(
                        Icons.bookmark_add_rounded,
                        size: 28,
                        color: savedJobs.contains(job.id)
                            ? Theme.of(context).colorScheme.primary
                            : Color.fromARGB(57, 28, 28, 29),

                        // ref
                        //         .read(bookmarkedJobsProvider.notifier)
                        //         .list
                        //         .contains(job.id)
                        //     ? Colors.blue
                        //     : Colors.grey,
                      )),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            showLocation
                ? Row(
                    children: [
                      Icon(
                        Icons.pin_drop_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        job.city != null ? "${job.city!} , " : "",
                        style: company_name(),
                      ),
                      Text(
                        job.country,
                        style: company_name(),
                      ),
                    ],
                  )
                : Container(),
            // const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: job.type
                  .map((e) => Chip(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      side: BorderSide.none,
                      label: Text(
                        e,
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w600),
                      )))
                  .toList(),
            ),
            !applied ? const Divider() : Container(),
            //  const Spacer(),
            job.salary != null && applied == false
                ? Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: job.salary != null
                                ? "Rs ${formatNumber(job.salary.toString())}"
                                : "",
                            style: blue_subheading(),
                            children: <TextSpan>[
                              TextSpan(
                                text: job.salary != null ? "/month" : "",
                                style: body3(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
