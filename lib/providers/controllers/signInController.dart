import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pocketjob/providers/authProvider.dart';
import 'package:pocketjob/screens/signin.dart';
import 'package:pocketjob/models/users.dart';
import 'package:pocketjob/providers/RepoProviders.dart';
import 'package:pocketjob/providers/savedJobsHandler.dart';
import 'package:pocketjob/providers/userProvider.dart';
import 'package:pocketjob/widgets/bottom_navigation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../appliedJobsHandler.dart';

part 'signInController.g.dart';

@riverpod
class AuthController extends _$AuthController {
  FutureOr<void> build() {
    // no-op
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final userRepository = ref.read(userRepositoryProvider);
    final authRepository = ref.read(authRepositoryProvider);
    try {
      state = const AsyncValue.loading();

      state = await AsyncValue.guard(() => authRepository.signInwithGoogle());
    } catch (e) {
      state = AsyncValue.error("Could not sign in", StackTrace.current);
    } finally {
      if (state.hasError == false) {
        //  state = const AsyncValue.data(null);
        state = const AsyncValue.loading();
        User? firebaseUser = authRepository.getUser();
        UserModel? exists = await userRepository.getUser(firebaseUser!.uid);
        if (exists == null) {
          UserModel user = UserModel(
              userId: firebaseUser.uid,
              email: firebaseUser.email!,
              name: firebaseUser.displayName!,
              savedJobs: [],
              appliedJobs: []);

          await userRepository.createUser(user);
          ref.read(CurrentUserProvider.notifier).getuser(user);
        } else {
          await ref.read(jobApplicationsProvider.notifier).getjobs();
          await ref.read(handleSavedJobsProvider.notifier).getjobs();
          ref.read(CurrentUserProvider.notifier).getuser(exists);
        }
        state = const AsyncValue.data(null);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottomNav()));
      }
    }
  }

  Future<void> signUpWithIdPassword(BuildContext context, String email,
      String password, String userName) async {
    final authRepository = ref.read(authRepositoryProvider);
    final userRepository = ref.read(userRepositoryProvider);
    try {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(
          () => authRepository.signUp(email, password, userName));
    } catch (e) {
      state = AsyncValue.error("Could not sign in", StackTrace.current);
    } finally {
      if (state.hasError == false) {
        state = const AsyncValue.loading();
        User? firebaseUser = authRepository.getUser();
        UserModel user = UserModel(
            userId: firebaseUser!.uid,
            email: email,
            name: userName,
            savedJobs: [],
            appliedJobs: []);
        ref.read(CurrentUserProvider.notifier).getuser(user);

        await userRepository.createUser(user);

        state = const AsyncValue.data(null);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
      }
    }
  }

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    final authRepository = ref.read(authRepositoryProvider);
    try {
      state = const AsyncValue.loading();
      state =
          await AsyncValue.guard(() => authRepository.logIn(email, password));
    } catch (e) {
      state = AsyncValue.error("Could not log in", StackTrace.current);
    } finally {
      if (state.hasError == false) {
        //   state = const AsyncValue.data(null);
        state = const AsyncValue.loading();
        User? firebaseUser = authRepository.getUser();
        UserModel? user =
            await ref.read(userRepositoryProvider).getUser(firebaseUser!.uid);
        ref.read(CurrentUserProvider.notifier).getuser(user!);
        print("usserr" + user.toString());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
        await ref.read(jobApplicationsProvider.notifier).getjobs();
        await ref.read(handleSavedJobsProvider.notifier).getjobs();
        state = const AsyncValue.data(null);
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      state = const AsyncValue.loading();
      ref.read(CurrentUserProvider.notifier).sendUser();
      // ref.read(handleSavedJobsProvider.notifier).updateSavedJobsList();
      // ref.read(handleAppliedJobsProvider.notifier).updateSavedJobsList();
      final authservice = ref.read(authRepositoryProvider);

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
