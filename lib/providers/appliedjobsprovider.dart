// import 'package:pocketjob/models/jobListing.dart';
// import 'package:pocketjob/providers/userServprovider.dart';
// import 'package:pocketjob/serv/authentication.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'appliedjobsprovider.g.dart';

// @riverpod
// Stream<List<JobListing>> displayApplied(displayAppliedRef ref) {
//   Stream<List<JobListing>> dataList = ref
//       .watch(userserviceProvider)
//       .getAppliedJobStream(AuthServ().getUserId()!);

//   return dataList;
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/authProvider.dart';
import 'package:pocketjob/providers/userRepoprovider.dart';


final appliedProvider = AutoDisposeStreamProvider<List<JobListing>>(((ref) {
  final userservice = ref.watch(userserviceProvider);
  final authServ = ref.watch(authProvider);
  return userservice.getAppliedJobsStream(authServ.getUserId()!);
}));
