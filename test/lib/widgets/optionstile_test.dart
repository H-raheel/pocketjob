import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:pocketjob/widgets/optionstile.dart';

void main() {
  testGoldens(
    'display tile',
    (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
            widget: ProfileOption(
          option: "Profile",
          icon: Icon(Icons.person),
        ))
        ..addScenario(
          widget: ProfileOption(
            option: "Add Skills",
            icon: Icon(Icons.pie_chart_rounded),
          ),
        )
        ..addScenario(
          widget: ProfileOption(
            option: "Contact Us",
            icon: Icon(Icons.mail_rounded),
          ),
        )
        ..addScenario(
          widget: ProfileOption(
              option: "Privacy policy", icon: Icon(Icons.info_rounded)),
        );
      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'optionstilecard');
    },
  );
}

//DisplayCard