import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:pocketjob/models/jobListing.dart';
import 'package:pocketjob/screens/job_info.dart';

void main() {
  testGoldens(
    'display card',
    (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
          widget: JobInfoScreen(
            jobDetails: JobListing(
              title: 'Frontend Developer Intern',
              company: 'CodeCrafters',
              salary: 10000,
              city: 'Islamabad',
              country: 'Pakistan',
              type: ['Internship', 'Remote', 'Part-Time'],
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQp-HbD7SMynjxZzoqFEVpLGuPnLZwvNkJ0Mhz8XfNK_Q&s',
              description: '''
      Assist in the development and maintenance of web applications.
      Work with the design team to implement user interfaces and features.
      Write clean, efficient, and maintainable code using HTML, CSS, and JavaScript.
      Collaborate with backend developers to integrate frontend components.
      Gain hands-on experience in frontend development best practices.
    ''',
              qualification: '''
      Basic knowledge of HTML, CSS, and JavaScript.
      Familiarity with frontend frameworks such as React or Vue.js is a plus but not required.
      Eagerness to learn and grow as a frontend developer.
      Good communication and teamwork skills.
      Pursuing or recently completed a degree in Computer Science or related field.
    ''',
              companyInfo: '''
      CodeCrafters is a software development company that specializes in creating innovative solutions for clients worldwide. We believe in nurturing talent and providing opportunities for growth. Our internship program offers students the chance to gain practical experience in a real-world development environment. Whether you're a beginner looking to kickstart your career or a student eager to expand your skills, CodeCrafters welcomes you to join our team and embark on an exciting journey in tech.
    ''',
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'jobinfocard');
    },
  );
}

//DisplayCard