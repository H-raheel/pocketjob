// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:pocketjob/providers/authRepoProvider.dart';
// import 'package:pocketjob/providers/RepoProviders.dart';
// import 'package:pocketjob/providers/savedJobsHandler.dart';


// void main() {
//   group('handleSavedJobs', () {
//     test('getjobs updates state with saved jobs', () async {
//       // Create a ProviderContainer
//       final container = ProviderContainer();
//       addTearDown(container.dispose);
// // final currentUser = container.read(CurrentUserProvider.notifier);
//       // Initialize handleSavedJobs with mock dependencies
//       final handleSavedJobs = handleSavedJobs(handleSavedJobsProvider.notifier);

//       // Mock UserRepository response
//       final mockSavedJobs = ['job1', 'job2', 'job3'];
//       when(container.read(userRepositoryProvider).getSavedJobs(any))
//           .thenAnswer((_) async => mockSavedJobs);

//       // Call the method
//       await handleSavedJobs.getjobs();

//       // Verify state is updated
//       expect(handleSavedJobs.state, mockSavedJobs);
//     });

//     test('isIdPresent returns true when ID is in state', () {
//       // Create a ProviderContainer
//       final container = ProviderContainer();
//       addTearDown(container.dispose);

//       // Initialize handleSavedJobs with mock dependencies
//       final handleSavedJobs = handleSavedJobs(container.read);

//       // Set state
//       handleSavedJobs.state = ['job1', 'job2', 'job3'];

//       // Call the method
//       final result = handleSavedJobs.isIdPresent('job2');

//       // Verify result
//       expect(result, isTrue);
//     });

//     test('isIdPresent returns false when ID is not in state', () {
//       // Create a ProviderContainer
//       final container = ProviderContainer();
//       addTearDown(container.dispose);

//       // Initialize handleSavedJobs with mock dependencies
//       final handleSavedJobs = handleSavedJobs(container.read);

//       // Set state
//       handleSavedJobs.state = ['job1', 'job2', 'job3'];

//       // Call the method
//       final result = handleSavedJobs.isIdPresent('job4');

//       // Verify result
//       expect(result, isFalse);
//     });

//     test('update adds ID to state if not already present', () {
//       // Create a ProviderContainer
//       final container = ProviderContainer();
//       addTearDown(container.dispose);

//       // Initialize handleSavedJobs with mock dependencies
//       final handleSavedJobs = handleSavedJobs(container.read);

//       // Set state
//       handleSavedJobs.state = ['job1', 'job2', 'job3'];

//       // Call the method
//       handleSavedJobs.update('job4');

//       // Verify state is updated
//       expect(handleSavedJobs.state, ['job1', 'job2', 'job3', 'job4']);
//     });

//     test('update removes ID from state if already present', () {
//       // Create a ProviderContainer
//       final container = ProviderContainer();
//       addTearDown(container.dispose);

//       // Initialize handleSavedJobs with mock dependencies
//       final handleSavedJobs = handleSavedJobs(container.read);

//       // Set state
//       handleSavedJobs.state = ['job1', 'job2', 'job3'];

//       // Call the method
//       handleSavedJobs.update('job2');

//       // Verify state is updated
//       expect(handleSavedJobs.state, ['job1', 'job3']);
//     });

//     test('updateSavedJobsList sends saved jobs to user', () async {
//       // Create a ProviderContainer
//       final container = ProviderContainer();
//       addTearDown(container.dispose);

//       // Initialize handleSavedJobs with mock dependencies
//       final handleSavedJobs = handleSavedJobs(container.read);

//       // Mock UserRepository response
//       final mockUserId = 'user123';
//       final mockSavedJobs = ['job1', 'job2', 'job3'];
//       when(container.read(authRepositoryProvider).getUserId())
//           .thenReturn(mockUserId);
//       when(container.read(userRepositoryProvider).sendSavedJobsToUser(any, any))
//           .thenAnswer((_) async => {});

//       // Set state
//       handleSavedJobs.state = mockSavedJobs;

//       // Call the method
//       await handleSavedJobs.updateSavedJobsList();

//       // Verify method is called
//       verify(container.read(userRepositoryProvider).sendSavedJobsToUser(mockUserId, mockSavedJobs));
//     });
//   });
// }
