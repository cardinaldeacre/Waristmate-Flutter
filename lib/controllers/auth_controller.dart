import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:waristmate_app/controllers/personal_note_controller.dart';
import 'package:waristmate_app/services/auth/auth_service.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService;
  final PersonalNoteController _personalNoteController;

  AuthController({
    AuthService? authService,
    PersonalNoteController? personalNoteController,
  }) : _authService = authService ?? AuthService(),
       _personalNoteController =
           personalNoteController ?? PersonalNoteController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signInWithGoogle() async {
    _setLoading(true);
    _errorMessage = null;

    try {
      final response = await _authService.signInWithGoogle();

      if (response == null) {
        return false;
      }

      await _syncAfterAuthChange();
      return true;
    } catch (e) {
      await _authService.signOut();
      _errorMessage = _mapAuthError(e);
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    _setLoading(true);
    try {
      await _authService.signOut();
      await _syncAfterAuthChange();
    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }

  Future<void> _syncAfterAuthChange() async {
    await _personalNoteController.getPersonalNote();
    notifyListeners();
  }

  String _mapAuthError(Object e) {
    if (e is PlatformException) {
      return 'Gagal masuk dengan Google. Silakan coba lagi.';
    }
    return 'Terjadi kesalahan. Silakan coba lagi.';
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
