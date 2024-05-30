import 'dart:core';

import 'package:pocketjob/providers/userRepoprovider.dart';
import 'package:pocketjob/repo/authentication.dart';
import 'package:pocketjob/repo/userRepo.dart';
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
    final userRepository = ref.read(userRepositoryProvider);
    state = const AsyncLoading();

    state = AsyncValue.data(
        await userRepository.getSavedJobs(AuthRepo().getUserId()!));
    //print("jobsssssssss");
    Future<List<String>> jobs =
        userRepo().getSavedJobs(AuthRepo().getUserId()!);
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
    if (list.contains(jobId)) {
      _remove(jobId);
    } else {
      _add(jobId);
    }
    await userRepo().saveJobToUser(AuthRepo().getUserId()!, jobId);
    //state=await userRepo().saveJobToUser(AuthRepo().getUserId()!, jobId);
  }
}
