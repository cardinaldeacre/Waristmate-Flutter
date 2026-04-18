// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class AuthService {
//   final _supabase = Supabase.instance.client;
//   final _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

//   Future<User?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

//       if (googleUser == null) {
//         return null;
//       }

//       final GoogleSignInAuthentication googleAuth = googleUser.authentication;
//       final idToken = googleAuth.idToken;
//       final accessToken = googleAuth.accessToken;

//       if (idToken == null || accessToken == null) {
//         print('Google Sign-In failed: Missing tokens');
//         return null;
//       }

//       final response = await _supabase.auth.signInWithIdToken(
//         provider: OAuthProvider.google,
//         idToken: idToken,
//         accessToken: accessToken,
//       );
//       return response.user;
//     } catch (error) {
//       print('Google Sign-In error: $error');
//       return null;
//     }
//   }
// }
