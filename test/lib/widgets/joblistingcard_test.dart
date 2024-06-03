import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/providers/savedJobsHandler.dart';
import 'package:pocketjob/widgets/job_listing_card.dart';

// Define a mock job listing for the test
final mockJob = JobListing(
  id: '1',
  title: 'Software Engineer',
  company: 'Tech Co.',
  imageUrl: 'https://via.placeholder.com/60',
  city: 'San Francisco',
  country: 'USA',
  type: ['Beginner', 'Remote', 'Part-Time'],
  description: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
  qualification: "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww",
  companyInfo: "hhhhhhhhhhhhhhhhhhhhhhhhh",
  salary: 120000,
);

class MockUserRepository {
  Future<List<String>> getSavedJobs(String userId) async {
    return ['1,2,3'];
  }

  Future<void> sendSavedJobsToUser(String userId, List<String> jobs) async {}
}

class MockAuthRepository {
  String? getUserId() {
    return 'user123';
  }
}

final userRepositoryProvider = Provider((_) => MockUserRepository());
final authRepositoryProvider = Provider((_) => MockAuthRepository());

void main() {
  // Ensure that your tests are executed with the necessary widget bindings
  TestWidgetsFlutterBinding.ensureInitialized();

  // Define the widget test
  testWidgets('JobListingCard widget test',
   (WidgetTester tester) async {
    // Initialize providers
    final container = ProviderContainer(
      overrides: [
        userRepositoryProvider.overrideWithValue(MockUserRepository()),
        authRepositoryProvider.overrideWithValue(MockAuthRepository()),
        handleSavedJobsProvider.overrideWith((ref) => handleSavedJobs(ref)),
      ],
    );

    // Trigger an initial state update for handleSavedJobsProvider
    await container.read(handleSavedJobsProvider.notifier).getjobs();

    // Wrap the widget with necessary providers and other required widgets
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: JobListingCard(
                job: mockJob,
                showLocation: true,
                applied: false,
              ),
            ),
          ),
        ),
      ),
    );

    // Allow the widget to settle
    await tester.pumpAndSettle();

    // Verify that the JobListingCard displays correct information
    expect(find.text('Software Engineer'), findsOneWidget);
    expect(find.text('Tech Co.'), findsOneWidget);
    expect(find.text('San Francisco , '), findsOneWidget);
    expect(find.text('USA'), findsOneWidget);
    expect(find.text('Beginner'), findsOneWidget);
    expect(find.text('Remote'), findsOneWidget);
    expect(find.text('Part-Time'), findsOneWidget);
    expect(find.text('Rs 120000'), findsOneWidget);
  });
}
