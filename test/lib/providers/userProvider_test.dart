import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocketjob/models/users.dart';
import 'package:pocketjob/providers/userProvider.dart';

void main() {
  group('CurrentUser', () {
    test('should update and get updated state', () {
      // Create a ProviderContainer
      final container = ProviderContainer();
      addTearDown(container.dispose);

      // Get the CurrentUser instance
      final currentUser = container.read(CurrentUserProvider.notifier);

      // Initial state should be null
      expect(currentUser.state, null);

      // Create a user model
      final user = UserModel(
        userId: '1234',
        name: 'Humera',
        email: '',
        phone: '',
        gender: '',
        savedJobs: [],
        appliedJobs: [],
        skills: [],
        lastHighestEducation: '',
        instituteAttended: '',
        yearOfGraduation: null,
      );

      // Update the user
      currentUser.getuser(user);

      // Verify the user is set correctly
      expect(currentUser.state?.name, 'Humera');

      // Update the state with new values
      currentUser.updateState(
        'Humera Raheel',
        '0334348348374',
        'test',
        'test2',
        2025,
        'Female',
      );

      // Assert the updated state
      expect(currentUser.state?.name, 'Humera Raheel');
      expect(currentUser.state?.phone, '0334348348374');
      expect(currentUser.state?.lastHighestEducation, 'test');
      expect(currentUser.state?.instituteAttended, 'test2');
      expect(currentUser.state?.yearOfGraduation, 2025);
      expect(currentUser.state?.gender, 'Female');
    });
  });
}
