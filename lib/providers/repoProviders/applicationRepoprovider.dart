import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/repo/applicationsRepo.dart';

final applicationRepositoryProvider = Provider<ApplicationsRepo>((ref) {
  return ApplicationsRepo();
});
