import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/repositories/authRepository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});
