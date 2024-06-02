import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/repositories/applicationsRepository.dart';


final applicationserviceProvider = Provider<ApplicationsRepository>((ref) {
  return ApplicationsRepository();
});
