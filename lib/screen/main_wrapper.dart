import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'home/home_screen.dart';
import 'calculator/calculator_screen.dart';
import 'modul/modul_screen.dart';
import 'profile/profile_screen.dart';
import 'note/note_screen.dart';
import 'package:flutter/services.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 2;

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
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.darkGreen,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _selectedIndex, children: _screens),

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Material(
          color: AppColors.darkGreen,
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Colors.transparent,
            elevation: 0,
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
