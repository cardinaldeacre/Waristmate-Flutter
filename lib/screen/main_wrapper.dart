import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'calculator_screen.dart';
import 'modul_screen.dart';
import 'profile_screen.dart';
import 'note_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    CalculatorScreen(),
    ModulScreen(),
    HomeScreen(),
    NoteScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color.fromARGB(255, 23, 126, 104);
    const Color darkGreen = Color(0xFF105C46);

    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: primaryGreen,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: darkGreen,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Kalkulator',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Modul'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Catatan'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
