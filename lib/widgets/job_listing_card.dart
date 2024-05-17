import 'package:flutter/material.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/utils/texts.dart';

class JobListingCard extends StatefulWidget {
  final JobListing job;
  final bool showLocation;
  final bool applied;
  const JobListingCard(
      {super.key,
      required this.job,
      required this.showLocation,
      required this.applied});

  @override
  State<JobListingCard> createState() => _JobListingCardState();
}

class _JobListingCardState extends State<JobListingCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 0.75,
        height: widget.showLocation
            ? MediaQuery.of(context).size.height * 0.3
            : MediaQuery.of(context).size.height * 0.28,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.applied
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
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: NetworkImage(widget.job.image_url))),
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        widget.job.title,
                        style: heading(),
                        maxLines: 3,
                      ),
                    ),
                    Text(widget.job.company, style: body2()),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.bookmark_add_rounded,
                  size: 28,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            widget.showLocation
                ? Row(
                    children: [
                      Icon(
                        Icons.pin_drop_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Text(
                        widget.job.city != null ? widget.job.city! + " , " : "",
                        style: body2(),
                      ),
                      Text(
                        widget.job.country,
                        style: body2(),
                      ),
                    ],
                  )
                : Container(),
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              alignment: WrapAlignment.start,
              children: widget.job.type
                  .map((e) => Chip(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      side: BorderSide.none,
                      label: Text(
                        e,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      )))
                  .toList(),
            ),
            !widget.applied ? Divider() : Container(),
            //  const Spacer(),
            widget.job.salary != null && widget.applied == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: widget.job.salary != null
                              ? "Rs " + widget.job.salary.toString()
                              : "",
                          style: salaryDisplayFont(),
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.job.salary != null ? "/month" : "",
                              style: body3(),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
