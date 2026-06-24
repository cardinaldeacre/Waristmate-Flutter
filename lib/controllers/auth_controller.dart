import 'package:flutter/material.dart';
import 'package:waristmate_app/controllers/personal_note_controller.dart';
import 'package:waristmate_app/services/auth/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> signInWithGoogle(BuildContext context) async {
    _setLoading(true);

    try {
      final response = await _authService.signInWithGoogle();

      if (response == null) {
        return false;
      }

      await syncAll();
      return true;
    } catch (e) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut(BuildContext context) async {
    _setLoading(true);

    try {
      await _authService.signOut();
      await syncAll();
    } catch (e) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> syncAll() async {
    try {
      final personalNoteController = PersonalNoteController();
      await personalNoteController.getPersonalNote();

      notifyListeners();
    } catch (e) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
