import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/repositories/authRepository.dart';
import 'package:pocketjob/providers/firebase/firebaseProviders.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(firebaseAuthProvider));
});