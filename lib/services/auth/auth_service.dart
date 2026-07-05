import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/core/config/auth_config.dart';

class AuthException implements Exception {
  final String message;
  const AuthException(this.message);

  @override
  String toString() => message;
}

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId: AuthConfig.clientIdForPlatform,
    scopes: ['email', 'profile'],
  );

  Future<AuthResponse?> signInWithGoogle({bool isRetry = false}) async {
    try {
      await _googleSignIn.signOut();

      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;
      final accessToken = googleAuth.accessToken;

      if (idToken == null || accessToken == null) {
        throw const AuthException('Token dari Google tidak ditemukan.');
      }

      final response = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      if (response.user == null) {
        throw const AuthException('Gagal memverifikasi akun.');
      }

      return response;
    } catch (e) {
      if (!isRetry && e is! AuthException) {
        await _googleSignIn.signOut();
        return signInWithGoogle(isRetry: true);
      }

      await _googleSignIn.signOut();

      if (e is AuthException) rethrow;
      throw const AuthException('Gagal masuk dengan Google. Coba lagi.');
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
    await _googleSignIn.signOut();
  }
}
