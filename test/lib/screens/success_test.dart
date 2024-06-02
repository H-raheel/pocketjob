import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:pocketjob/screens/success.dart';

void main() {
  testGoldens(
    'display card',
    (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
          widget: const Success(),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'success');
    },
  );
}

//DisplayCard