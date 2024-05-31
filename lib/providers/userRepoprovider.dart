import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/services/userRepo.dart';


final userserviceProvider = Provider<userServ>((ref) {
  return userServ();
});
