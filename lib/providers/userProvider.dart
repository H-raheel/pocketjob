import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/models/users.dart';
import 'package:pocketjob/providers/handleAppliedJobs.dart';
import 'package:pocketjob/providers/handleSavedJobs.dart';
import 'package:pocketjob/providers/userRepoprovider.dart';

final CurrentUserProvider =
    StateNotifierProvider<CurrentUser, UserModel?>((ref) {
  return CurrentUser(ref);
});

class CurrentUser extends StateNotifier<UserModel?> {
  final Ref ref;

  CurrentUser(this.ref) : super(null);

  void getuser(UserModel user) {
    print("updatedd");
    print(user.name);
    state = user;
  }

  void updateState(
      String newname,
      String? newphone,
      String? newlastHighestEducation,
      String? newinstituteAttended,
      int? newyearOfGraduation,
      String? newgender) {
    print("heeee");
    state = state?.copyWith(
      name: newname,
      phone: newphone,
      lastHighestEducation: newlastHighestEducation,
      instituteAttended: newinstituteAttended,
      yearOfGraduation: newyearOfGraduation,
      gender: newgender,
    );
    print(state.toString() + "state");
    print(state!.name);
    print(state!.gender);
    print(state!.lastHighestEducation);
  }

  void updateList(List<String> list) {
    state = state?.copyWith(
      skills: list,
    );
  }

  void sendUser() async {
    UserModel user = UserModel(
      userId: state!.userId,
      name: state!.name,
      email: state!.email,
      phone: state!.phone,
      gender: state!.gender,
      appliedJobs: ref.read(jobApplicationsProvider),
      savedJobs: ref.read(handleSavedJobsProvider),
      skills: state!.skills ?? [],
      lastHighestEducation: state?.lastHighestEducation ?? "",
      instituteAttended: state?.instituteAttended ?? "",
      yearOfGraduation: state?.yearOfGraduation,
    );

    ref.read(userRepositoryProvider).UpdateUser(user);
  }
}
