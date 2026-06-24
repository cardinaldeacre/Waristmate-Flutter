import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/core/config/auth_config.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId: AuthConfig.clientIdForPlatform,
    scopes: ['email', 'profile'],
  );

  Future<AuthResponse?> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final idToken = googleAuth.idToken;
    final accessToken = googleAuth.accessToken;

    if (idToken == null || accessToken == null) {
      throw Exception('Token tidak ditemukan');
    }

    return await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
    await _googleSignIn.signOut();
  }
}
