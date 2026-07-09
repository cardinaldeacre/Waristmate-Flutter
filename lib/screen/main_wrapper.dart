import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/controllers/personal_note_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/ui/bottom_navbar.dart';
import 'package:waristmate_app/widgets/ui/custom_alert.dart';
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
  bool _hasCheckedDraft = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _tryRestoreDraft() {
    if (_hasCheckedDraft) return;

    _hasCheckedDraft = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _restoreDraft();
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

    _tryRestoreDraft();
  }

  Future<void> _restoreDraft() async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      return;
    }

    final controller = context.read<PersonalNoteController>();
    if (!controller.hasDraft(user.id)) {
      await controller.getPersonalNote();
      return;
    }
    if (!mounted) return;

    CustomAlert.show(
      context,
      title: 'Lanjutkan Draft Catatan?',
      message:
          'Ditemukan perubahan catatan yang belum disimpan.\n\n'
          'Apakah Anda ingin melanjutkan pengeditan?',
      icon: Icons.restore_rounded,
      iconColor: AppColors.primaryGreen,
      confirmText: 'Lanjutkan',
      confirmColor: AppColors.primaryGreen,
      cancelText: 'Buang Draft',

      onConfirm: () async {
        if (!mounted) return;

        _onItemTapped(3);
        try {
          await controller.loadDraft(user.id);

          controller.setEditMode(true);
          await controller.deleteDraft(user.id);
        } catch (e) {
          debugPrint("RESTORE: ERROR $e");
        }
      },

      onCancel: () async {
        await controller.deleteDraft(user.id);

        await controller.getPersonalNote();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: IndexedStack(index: _selectedIndex, children: screens),

      bottomNavigationBar: BottomNavbar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
