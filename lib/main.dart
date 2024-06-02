import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/features/authentication/presentation/authProvider.dart';
import 'package:pocketjob/firebase_options.dart';
import 'package:pocketjob/screens/splash_screen.dart';
import 'package:pocketjob/widgets/bottom_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: (MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User? user = ref.read(authRepositoryProvider).getUser();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pocket Job',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFFFFBFF),
            scrolledUnderElevation: 0,
          ),
          scaffoldBackgroundColor: const Color(0xFFFFFBFF),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 248, 248, 255),
            primary: Color.fromARGB(255, 29, 26, 215),
            secondary: Color(0xFFF6F6F6),
            tertiary: Color(0xFFFDFDFD),
          ),
          useMaterial3: true,
        ),
        home: user == null ? SplashScreen() : BottomNav());

    // home: BottomNav());
  }
}
