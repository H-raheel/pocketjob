import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/repo/userRepo.dart';

final userRepositoryProvider = Provider<userRepo>((ref) {
  return userRepo();
});
