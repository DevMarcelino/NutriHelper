import 'package:flutter/material.dart';
import 'package:nutrihelper/Doctor%20Appoinment%20App/View/home_screen.dart';
import 'package:nutrihelper/Doctor%20Appoinment%20App/View/schedule_screen.dart';
import 'package:nutrihelper/Doctor%20Appoinment%20App/View/search.dart';
import 'package:iconsax/iconsax.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final List pages = [
    const DoctorAppoinmentHomeScreen(),
    const search(),
    const Scaffold(),
    const ScheduleScreen(),  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black26,
        selectedItemColor: const Color(0xFF52CA1A),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home5),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal),
            label: "Pesquisa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.scan),
            label: "Scan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.bookmark),
            label: "Biblioteca",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Configurações",
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
