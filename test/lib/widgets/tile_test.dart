

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
            heading: 'Working Mode',
            sub: '20000',
            icon: Icons.work,
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'my_displaycard');
    },
  );
}

//DisplayCard