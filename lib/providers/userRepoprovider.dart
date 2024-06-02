import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/repositories/userRepository.dart';

final userRepositoryProvider = Provider<userRepository>((ref) {
  return userRepository();
});
