import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/services/jobsRepo.dart';

final jobsserviceProvider = Provider<JobsServ>((ref) {
  return JobsServ();
});
