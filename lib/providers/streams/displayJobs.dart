import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/repoProviders/jobsRepoProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'displayJobs.g.dart';

@riverpod
Stream<List<JobListing>> display(DisplayRef ref) {
  Stream<List<JobListing>> dataList =
      ref.watch(jobsRepositoryProvider).getJobsStream();
  print(dataList);
  return dataList;
}
