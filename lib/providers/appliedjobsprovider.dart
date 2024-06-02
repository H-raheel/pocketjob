// import 'package:pocketjob/models/jobListing.dart';
// import 'package:pocketjob/providers/userRepositoryprovider.dart';
// import 'package:pocketjob/serv/authentication.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'appliedjobsprovider.g.dart';

// @riverpod
// Stream<List<JobListing>> displayApplied(displayAppliedRef ref) {
//   Stream<List<JobListing>> dataList = ref
//       .watch(userserviceProvider)
//       .getAppliedJobStream(AuthRepository().getUserId()!);

//   return dataList;
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/features/authentication/presentation/authProvider.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/RepoProviders.dart';

final appliedProvider = AutoDisposeStreamProvider<List<JobListing>>(((ref) {
  final userservice = ref.read(userRepositoryProvider);
  final authRepository = ref.watch(authRepositoryProvider);
  return userservice.getAppliedJobsStream(authRepository.getUserId()!);
}));
