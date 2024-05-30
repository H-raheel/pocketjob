import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/repo/applicationsRepo.dart';
import 'package:pocketjob/repo/jobsRepo.dart';

final jobsRepositoryProvider = Provider<JobsRepo>((ref) {
  return JobsRepo();
});
