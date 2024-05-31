import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/services/authentication.dart';

final authProvider = Provider<AuthServ>((ref) {
  return AuthServ();
});
