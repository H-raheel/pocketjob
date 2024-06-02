import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/firebase_options.dart';
import 'package:pocketjob/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: (MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pocket Job',
        theme: ThemeData(
          //scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFFFFBFF)),

          scaffoldBackgroundColor: const Color(0xFFFFFBFF),

          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 248, 248, 255),
            primary: Color.fromARGB(255, 29, 26, 215),
            secondary: Color(0xFFF6F6F6),
            tertiary: Color(0xFFFDFDFD),
            // onPrimaryContainer: const Color.fromARGB(255, 212, 212, 212)
            // onPrimaryContainer: Color.fromARGB(69, 212, 210, 210),
          ),
          useMaterial3: true,
        ),
        home: SplashScreen());

    // home: BottomNav());
  }
}
