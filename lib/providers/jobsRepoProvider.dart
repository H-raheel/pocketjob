import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/services/jobsServices.dart';

final jobsserviceProvider = Provider<JobsServ>((ref) {
  return JobsServ();
});
