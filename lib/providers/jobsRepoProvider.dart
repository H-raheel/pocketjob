import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/repositories/jobsRepository.dart';


final jobsserviceProvider = Provider<JobsRepository>((ref) {
  return JobsRepository();
});
