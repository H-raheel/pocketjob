import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/jobsRepoProvider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'displayJobs.g.dart';

@riverpod
Stream<List<JobListing>> display(DisplayRef ref) {
  Stream<List<JobListing>> dataList =
      ref.watch(jobsserviceProvider).getJobsStream();
  print(dataList);
  return dataList;
}
