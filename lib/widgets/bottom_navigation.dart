import 'package:flutter/material.dart';
import 'package:pocketjob/screens/applied.dart';
import 'package:pocketjob/screens/home_screen.dart';
import 'package:pocketjob/screens/profile.dart';
import 'package:pocketjob/screens/saved_jobs.dart';
import 'package:pocketjob/utils/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  final screens = [HomeScreen(), SavedJobs(), AppliedJobs(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 212, 212, 212)),
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          backgroundColor: Colors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: mainColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          //currentIndex: 1,
          // iconSize: 30,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
            BottomNavigationBarItem(
              icon: Icon(Icons.business_center_rounded),
              label: "Application",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_rounded), label: "Profile")
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
