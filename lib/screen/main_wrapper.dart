import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/core/extension/context_extension.dart';
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
    final bool isLandscape = context.isLandscape;

    final List<Widget> screens = [
      CalculatorScreen(),
      ModulScreen(),
      HomeScreen(
        onNavigateToCalculator: () {
          _onItemTapped(0);
        },
      ),
      NoteScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      extendBody: true,
      body: isLandscape
          ? Row(
              children: [
                Expanded(
                  child: IndexedStack(index: _selectedIndex, children: screens),
                ),
                Container(
                  width: 100,
                  padding: const EdgeInsets.only(right: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.darkGreen,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: _buildNavItem(
                          index: 0,
                          icon: 'assets/icons/ic_calculate.png',
                        ),
                      ),
                      Expanded(
                        child: _buildNavItem(
                          index: 1,
                          icon: 'assets/icons/ic_book.png',
                        ),
                      ),
                      Expanded(
                        child: _buildNavItem(
                          index: 2,
                          icon: 'assets/icons/ic_home.png',
                        ),
                      ),
                      Expanded(
                        child: _buildNavItem(
                          index: 3,
                          icon: 'assets/icons/ic_server_person.png',
                        ),
                      ),
                      Expanded(
                        child: _buildNavItem(
                          index: 4,
                          icon: 'assets/icons/ic_person.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : IndexedStack(index: _selectedIndex, children: screens),

      bottomNavigationBar: isLandscape
          ? null
          : ClipRRect(
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
                      icon: ImageIcon(
                        AssetImage('assets/icons/ic_calculate.png'),
                      ),
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

  Widget _buildNavItem({required int index, required String icon}) {
    final selected = _selectedIndex == index;

    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Center(
        child: ImageIcon(
          AssetImage(icon),
          color: selected ? Colors.white : Colors.white70,
        ),
      ),
    );
  }
}
