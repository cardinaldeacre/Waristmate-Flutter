import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthException implements Exception {
  final String message;
  const AuthException(this.message);

  @override
  String toString() => message;
}

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static const _scopes = ['email', 'profile'];

  Future<AuthResponse?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.authenticate();

      final idToken = googleUser.authentication.idToken;
      if (idToken == null) {
        throw const AuthException('Token dari Google tidak ditemukan.');
      }

      final authorization =
          await googleUser.authorizationClient.authorizationForScopes(
            _scopes,
          ) ??
          await googleUser.authorizationClient.authorizeScopes(_scopes);

      final accessToken = authorization.accessToken;

      final response = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (response.user == null) {
        throw const AuthException('Gagal memverifikasi akun.');
      }

      return response;
    } on GoogleSignInException catch (e) {
      debugPrint(
        'GoogleSignInException -> code: ${e.code}, message: ${e.description}',
      );
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return null;
      }
      throw AuthException('Gagal dari Google: ${e.description}');
    } catch (e) {
      debugPrint('signInWithGoogle unknown error: $e');
      throw const AuthException('Gagal masuk dengan Google. Coba lagi.');
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      debugPrint('Google signOut error: $e');
    }
  }
}
