import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/controllers/personal_note_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/note/note_header.dart';
import 'package:waristmate_app/widgets/note/note_card.dart';
import 'package:waristmate_app/widgets/note/save_button.dart';
import 'package:waristmate_app/widgets/ui/message_snackbar.dart';
import 'package:waristmate_app/widgets/ui/not_logged_in.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> with WidgetsBindingObserver {
  late final StreamSubscription<AuthState> _authSubscription;
  User? _user;

  @override
  void initState() {
    super.initState();

    _user = Supabase.instance.client.auth.currentUser;

    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((
      data,
    ) {
      setState(() {
        _user = data.session?.user;
      });
    });

    final noteController = context.read<PersonalNoteController>();

    noteController.clearForm();
    noteController.getPersonalNote();
  }

  void _toggleEditMode() {
    final controller = context.read<PersonalNoteController>();

    controller.setEditMode(!controller.isEditModeEnabled);
  }

  Future<void> _saveData() async {
    final noteController = context.read<PersonalNoteController>();
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      showMessageSnackbar(
        context,
        'Error: Pengguna belum login!',
        AppColors.errorRed,
      );
      return;
    }

    try {
      await noteController.savePersonalNote(user.id);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Catatan disimpan!'),
          backgroundColor: AppColors.spanBlue,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
          margin: EdgeInsets.fromLTRB(16, 16, 16, 100),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      _toggleEditMode();
    } catch (e) {
      if (!mounted) return;

      final errorString = e.toString();

      if (errorString.contains('OFFLINE_SAVED')) {
        showMessageSnackbar(
          context,
          'Internet terputus. Catatan sementara disimpan aman di perangkat Anda.',
          AppColors.warningYellow,
        );

        _toggleEditMode();
        return;
      }

      showMessageSnackbar(context, 'Gagal menyimpan: $e', AppColors.errorRed);
      return;
    }
  }

  Future<void> _refreshData() async {
    final noteController = context.read<PersonalNoteController>();

    await noteController.getPersonalNote();

    if (!mounted) return;

    showMessageSnackbar(
      context,
      'Data berhasil disinkronkan',
      AppColors.spanBlue,
    );
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = _user != null;

    return isLoggedIn
        ? Scaffold(
            backgroundColor: AppColors.backgroundClean,
            extendBodyBehindAppBar: true,
            body: Column(
              children: [
                NoteHeader(),
                const SizedBox(height: 5),
                Expanded(
                  child: Stack(
                    children: [
                      RefreshIndicator(
                        onRefresh: _refreshData,
                        child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(bottom: 120),
                          children: [NoteCard()],
                        ),
                      ),

                      Positioned(
                        right: 16,
                        bottom: 113,
                        child: SaveButton(
                          onToggle: _toggleEditMode,
                          onSave: _saveData,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : NotLoggedIn();
  }
}
