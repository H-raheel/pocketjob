import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/repositories/applicationsRepository.dart';
import 'package:pocketjob/repositories/jobsRepository.dart';
import 'package:pocketjob/repositories/userRepository.dart';

final applicationRepositoryProvider = Provider<ApplicationsRepository>((ref) {
  return ApplicationsRepository();
});

final userRepositoryProvider = Provider<userRepository>((ref) {
  return userRepository();
});
final jobsRepositoryProvider = Provider<JobsRepository>((ref) {
  return JobsRepository();
});
