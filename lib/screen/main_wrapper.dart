import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
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
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
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
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: AppColors.darkGreen,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/ic_calculate.png')),
                label: 'Kalkulator',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/ic_book.png')),
                label: 'Modul',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/ic_home.png')),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/ic_server_person.png'),
                ),
                label: 'Catatan',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/icons/ic_person.png')),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
