import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:pocketjob/screens/splash_screen.dart';

void main() {
  testGoldens(
    'display card',
    (tester) async {
      final builder = DeviceBuilder()
        ..addScenario(
          widget: const SplashScreen(),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'splash_screen');
    },
  );
}

//DisplayCard