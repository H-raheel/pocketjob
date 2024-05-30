import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/repoProviders/userRepoprovider.dart';
import 'package:pocketjob/repo/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmarkedprovider.g.dart';

@riverpod
Stream<List<JobListing>> bookmarked(BookmarkedRef ref) {
  Stream<List<JobListing>> dataList = ref
      .watch(userRepositoryProvider)
      .getSavedJobsStream(AuthService().getUserId()!);

  return dataList;
}
