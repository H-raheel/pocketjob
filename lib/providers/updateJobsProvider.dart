import 'dart:core';

import 'package:pocketjob/features/authentication/presentation/authProvider.dart';
import 'package:pocketjob/providers/userRepoprovider.dart';
import 'package:pocketjob/repositories/userRepository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'updateJobsProvider.g.dart';

@riverpod
//make this future
class BookmarkedJobs extends _$BookmarkedJobs {
  List<String> list = [];
  @override
  Future<List<String>> build() async {
    return await getFromFirebase();
  }

  Future getFromFirebase() async {
    final authRepository = ref.read(authRepositoryProvider);
    final userRepository = ref.read(userRepositoryProvider);
    state = const AsyncLoading();

    state = AsyncValue.data(
        await userRepository.getSavedJobs(authRepository.getUserId()!));
    
    Future<List<String>> jobs =
       userRepository.getSavedJobs(authRepository.getUserId()!);
    list = await jobs;

    print("jobsssssssss");
  }

  void _add(String jobId) {
    list = [...list, jobId];
  }

  void _remove(String jobId) {
    list = list.where((id) => id != jobId).toList();
  }

  void updateJobList(String jobId) async {
    final authRepository = ref.read(authRepositoryProvider);
    if (list.contains(jobId)) {
      _remove(jobId);
    } else {
      _add(jobId);
    }
    await userRepository().saveJobToUser(authRepository.getUserId()!, jobId);
    //state=await userRepository().saveJobToUser(AuthRepository().getUserId()!, jobId);
  }
}
