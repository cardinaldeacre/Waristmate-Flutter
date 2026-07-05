import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/controllers/personal_note_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/note/note_header.dart';
import 'package:waristmate_app/widgets/note/note_card.dart';
import 'package:waristmate_app/widgets/note/save_button.dart';
import 'package:waristmate_app/widgets/ui/not_logged_in.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  bool _isEditMode = false;

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
    noteController.getPersonalNote();
  }

  void _toggleEditMode() {
    setState(() {
      _isEditMode = !_isEditMode;
    });
  }

  Future<void> _saveData() async {
    final noteController = context.read<PersonalNoteController>();
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Error: User belum login!')));
      return;
    }

    try {
      await noteController.savePersonalNote(user.id);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Catatan disimpan!'),
          backgroundColor: AppColors.spanBlue,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.fromLTRB(16, 16, 16, 100),
        ),
      );
      _toggleEditMode();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal menyimpan catatan: $e'),
          backgroundColor: AppColors.errorRed,
        ),
      );
      return;
    }
  }

  Future<void> _refreshData() async {
    final noteController = context.read<PersonalNoteController>();

    await noteController.getPersonalNote();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil disinkronkan'),
        backgroundColor: AppColors.spanBlue,
      ),
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
                          children: [NoteCard(isEditMode: _isEditMode)],
                        ),
                      ),

                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: 23,
                        child: SaveButton(
                          onToggle: _toggleEditMode,
                          isEditMode: _isEditMode,
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
