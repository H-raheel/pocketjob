import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/providers/authRepoProvider.dart';
import 'package:pocketjob/providers/RepoProviders.dart';

final handleSavedJobsProvider =
    StateNotifierProvider<handleSavedJobs, List<String>>((ref) {
  return handleSavedJobs(ref);
});

class handleSavedJobs extends StateNotifier<List<String>> {
  final Ref ref;

  handleSavedJobs(this.ref) : super([]);

  Future<void> getjobs() async {
    final userRepository = ref.read(userRepositoryProvider);
    final authRepository = ref.read(authRepositoryProvider);
    final userId = authRepository.getUserId();

    if (userId != null) {
      List<String> jobs = await userRepository.getSavedJobs(userId);
      state = jobs;
      print("state updated: $state");
    }
  }

  bool isIdPresent(String id) {
    print("Checking ID $id in state: $state");
    return state.contains(id);
  }

  void _remove(String jobId) {
    state = state.where((id) => id != jobId).toList();
  }

  void _add(String jobId) {
    state = [...state, jobId];
  }

  void update(String jobId) {
    if (state.contains(jobId)) {
      _remove(jobId);
    } else {
      _add(jobId);
    }
    //list = state;
  }

  void updateSavedJobsList() async {
    final userRepository = ref.read(userRepositoryProvider);
    final authRepository = ref.read(authRepositoryProvider);
    final userId = authRepository.getUserId();
    await userRepository.sendSavedJobsToUser(userId!, state);
  }
}
