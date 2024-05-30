// import 'package:pocketjob/models/jobListing.dart';
// import 'package:pocketjob/providers/userRepoprovider.dart';
// import 'package:pocketjob/repo/authentication.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'appliedjobsprovider.g.dart';

// @riverpod
// Stream<List<JobListing>> displayApplied(displayAppliedRef ref) {
//   Stream<List<JobListing>> dataList = ref
//       .watch(userRepositoryProvider)
//       .getAppliedJobStream(AuthRepo().getUserId()!);

//   return dataList;
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/authProvider.dart';
import 'package:pocketjob/providers/userRepoprovider.dart';

final appliedProvider = AutoDisposeStreamProvider<List<JobListing>>(((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
final authRepo = ref.watch(authProvider);
  return userRepository.getAppliedJobsStream(authRepo.getUserId()!);
}));
