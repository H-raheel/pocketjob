import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:pocketjob/widgets/tile.dart';

void main() {
  testGoldens(
    'display card',
    (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
          widget: const DisplayCard(
            heading: 'Salary(Monthly)',
            sub: '12,000',
            icon: Icons.money,
          ),
        )
        ..addScenario(
          widget: const DisplayCard(
            heading: 'Working Mode',
            sub: 'Remote',
            icon: Icons.apartment,
          ),
        )
        ..addScenario(
          widget: const DisplayCard(
            heading: 'Job Type',
            sub: 'Beginner',
            icon: Icons.business_center,
          ),
        )
        ..addScenario(
          widget: const DisplayCard(
            heading: 'Level',
            sub: 'Part-Time',
            icon: Icons.work,
          ),
        );
      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'tilecard');
    },
  );
}

//DisplayCard