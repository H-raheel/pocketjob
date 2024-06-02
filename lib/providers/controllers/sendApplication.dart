import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pocketjob/features/authentication/presentation/authProvider.dart';
import 'package:pocketjob/models/applications.dart';
import 'package:pocketjob/providers/handleAppliedJobs.dart';
import 'package:pocketjob/providers/userRepoprovider.dart';
import 'package:pocketjob/screens/success.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../applicationRepoprovider.dart';

part 'sendApplication.g.dart';

@riverpod
class ApplyForJob extends _$ApplyForJob {
  @override
  FutureOr<void> build() {
    // no-op
  }

  Future<void> sendApplication(
    ApplicationModel application,
    PlatformFile file,
    BuildContext context,
  ) async {
    try {
      print("inheree");
      state = const AsyncValue.loading();
      final user = ref.read(authRepositoryProvider).getUser();

      final applicationWithUserId = ApplicationModel(
        userId: user!.uid,
        name: application.name,
        email: application.email,
        phone: application.phone,
        currentlyEmployed: application.currentlyEmployed,
        currentCompany: application.currentCompany,
        position: application.position,
        jobId: application.jobId,
        status: application.status,
        pdfUrl: application.pdfUrl,
      );
      final applicationservice = ref.read(applicationserviceProvider);
      final userservice = ref.read(userRepositoryProvider);

      await applicationservice.saveApplication(applicationWithUserId, file);
      await userservice.saveAppliedJobToUser(user.uid, application.jobId);
      ref.read(jobApplicationsProvider.notifier).add(application.jobId);
      ref.read(jobApplicationsProvider.notifier).getjobs();
    } catch (e) {
      state = AsyncValue.error(Error, StackTrace.current);
    } finally {
      state = const AsyncValue.data(null);
      if (state.hasError == false) {
        ;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Success()));
      }
    }
  }
}
