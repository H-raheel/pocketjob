import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/repo/authentication.dart';

final authProvider = Provider<AuthRepo>((ref) {
  return AuthRepo();
});
