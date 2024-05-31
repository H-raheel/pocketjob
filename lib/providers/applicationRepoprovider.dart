import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/services/applicationsServices.dart';


final applicationserviceProvider = Provider<ApplicationsServ>((ref) {
  return ApplicationsServ();
});
