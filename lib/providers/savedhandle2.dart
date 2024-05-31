// import 'package:pocketjob/providers/authProvider.dart';
// import 'package:pocketjob/providers/userRepoprovider.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'applyButtonController.g.dart';

// @riverpod
// class JobApplications extends _$JobApplications {
//   @override
//   List<String> build() {
//     return [];
//   }

//   void getjobs() async {
//     final userRepository = ref.read(userRepositoryProvider);
//     final authRepo = ref.read(authProvider);
//     List<String> jobs =
//         await userRepository.getAppliedJobs(authRepo.getUserId()!);
//     state = jobs;

//     ref.notifyListeners();
//     print("staaate");
//     print(state.toString());
//   }

//   bool isIdPresent(String id) {
//     print("id" + id);
//     print("infunction" + state.toString());
//     if (state.contains(id)) {
//       return true;
//     }
//     return false;
//   }
// }

// final applications = jobApplicationsProvider;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/providers/authProvider.dart';
import 'package:pocketjob/providers/userRepoprovider.dart';

final handleSavedJobsProvider =
    StateNotifierProvider<handleSavedJobs, List<String>>((ref) {
  return handleSavedJobs(ref);
});

class handleSavedJobs extends StateNotifier<List<String>> {
  final Ref ref;

  handleSavedJobs(this.ref) : super([]);

  Future<void> getjobs() async {
    final userRepository = ref.read(userRepositoryProvider);
    final authRepo = ref.read(authProvider);
    final userId = authRepo.getUserId();

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

  void updateSavedJobsList(String jobId) async {
    final userRepository = ref.read(userRepositoryProvider);
    final authRepo = ref.read(authProvider);
    final userId = authRepo.getUserId();
    await userRepository.sendSavedJobsToUser(userId!, state);
  }
}