import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/providers/authProvider.dart';
import 'package:pocketjob/providers/RepoProviders.dart';


final jobApplicationsProvider =
    StateNotifierProvider<JobApplications, List<String>>((ref) {
  return JobApplications(ref);
});

class JobApplications extends StateNotifier<List<String>> {
  final Ref ref;

  JobApplications(this.ref) : super([]);

  Future<void> getjobs() async {
    final userservice = ref.read(userRepositoryProvider);
    final authRepository = ref.read(authRepositoryProvider);
    final userId = authRepository.getUserId();

    if (userId != null) {
      List<String> jobs = await userservice.getAppliedJobs(userId);
      state = jobs;
      print("state updated: $state");
    }
  }

  bool isIdPresent(String id) {
    print("Checking ID $id in state: $state");
    return state.contains(id);
  }

  void add(String jobId) {
    state = [...state, jobId];
  }
}
