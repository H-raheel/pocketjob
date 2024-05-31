import 'package:flutter/material.dart';
import 'package:pocketjob/providers/authProvider.dart';
import 'package:pocketjob/providers/handleSavedJobs.dart';
import 'package:pocketjob/screens/signin.dart';
import 'package:pocketjob/widgets/bottom_navigation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../handleAppliedJobs.dart';

part 'signInController.g.dart';

@riverpod
class AuthController extends _$AuthController {
  FutureOr<void> build() {
    // no-op
  }
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      state = const AsyncValue.loading();
      final authservice = ref.read(authProvider);

      state = await AsyncValue.guard(() => authservice.signInwithGoogle());
    } catch (e) {
      state = AsyncValue.error("Could not sign in", StackTrace.current);
    } finally {
      if (state.hasError == false) {
        state = const AsyncValue.data(null);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottomNav()));
      }
      await ref.read(jobApplicationsProvider.notifier).getjobs();
      await ref.read(handleSavedJobsProvider.notifier).getjobs();
    }
  }

  Future<void> signUpWithIdPassword(BuildContext context, String email,
      String password, String userName) async {
    final authservice = ref.read(authProvider);
    try {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(
          () => authservice.signUp(email, password, userName));
    } catch (e) {
      state = AsyncValue.error("Could not sign in", StackTrace.current);
    } finally {
      if (state.hasError == false) {
        state = const AsyncValue.data(null);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
        await ref.read(jobApplicationsProvider.notifier).getjobs();
        await ref.read(handleSavedJobsProvider.notifier).getjobs();
      }
    }
  }

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    final authservice = ref.read(authProvider);
    try {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() => authservice.logIn(email, password));
    } catch (e) {
      state = AsyncValue.error("Could not log in", StackTrace.current);
    } finally {
      if (state.hasError == false) {
        state = const AsyncValue.data(null);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
        await ref.read(jobApplicationsProvider.notifier).getjobs();
        await ref.read(handleSavedJobsProvider.notifier).getjobs();
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      state = const AsyncValue.loading();
      ref.read(handleSavedJobsProvider.notifier).updateSavedJobsList();
      final authservice = ref.read(authProvider);

      state = await AsyncValue.guard(() => authservice.signOut());
    } catch (e) {
      state = AsyncValue.error("Could not sign out", StackTrace.current);
    } finally {
      if (state.hasError == false) {
        state = const AsyncValue.data(null);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      }
    }
  }
}
