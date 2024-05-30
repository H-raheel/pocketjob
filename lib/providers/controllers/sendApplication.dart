import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pocketjob/models/applications.dart';
import 'package:pocketjob/providers/repoProviders/applicationRepoprovider.dart';
import 'package:pocketjob/repo/authentication.dart';
import 'package:pocketjob/screens/success.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
      final userId = await AuthService().getUserId();
      final applicationWithUserId = ApplicationModel(
        userId: userId!,
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
      final applicationRepository = ref.read(applicationRepositoryProvider);

      await applicationRepository.saveApplication(applicationWithUserId, file);
    } catch (e) {
      state = AsyncValue.error(Error, StackTrace.current);
    } finally {
      state = const AsyncValue.data(null);
      if (state.hasError == false) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Success()));
      }
    }
  }
}
