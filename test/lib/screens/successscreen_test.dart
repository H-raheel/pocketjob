import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pocketjob/screens/success.dart';
import 'package:pocketjob/widgets/button/primmarybutton.dart';

void main() {
  testWidgets('Success screen displays correctly', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Success(),
      ),
    );

    // Verify the presence of various elements in the widget tree
    expect(find.text('CONGRATULATIONS!'), findsOneWidget);
    expect(find.text('Your Application has been successfully sent!'),
        findsOneWidget);
    expect(find.text('You can check your applications in Applied.'),
        findsOneWidget);
    expect(find.byType(PrimaryButton), findsNWidgets(2));
    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.widgetWithText(PrimaryButton, 'Go to Applications'),
        findsOneWidget);
    expect(find.widgetWithText(PrimaryButton, 'Go to Home'), findsOneWidget);
    expect(find.byIcon(Icons.check_rounded), findsOneWidget);
  });
}
