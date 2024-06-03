// import 'package:pocketjob/models/jobListing.dart';
// import 'package:pocketjob/providers/userRepositoryprovider.dart';
// import 'package:pocketjob/serv/authentication.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'appliedjobsprovider.g.dart';

// @riverpod
// Stream<List<JobListing>> displayApplied(displayAppliedRef ref) {
//   Stream<List<JobListing>> dataList = ref
//       .watch(userRepositoryProvider)
//       .getAppliedJobStream(AuthRepository().getUserId()!);

//   return dataList;
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/providers/authRepoProvider.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/RepoProviders.dart';

final appliedProvider = AutoDisposeStreamProvider<List<JobListing>>(((ref) {
  final userRepository = ref.read(userRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return userRepository.getAppliedJobsStream(authRepository.getUserId()!);
}));
