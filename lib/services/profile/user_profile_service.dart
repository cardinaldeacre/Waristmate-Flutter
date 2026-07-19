import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfileService {
  final SupabaseClient _supabase = Supabase.instance.client;
  final _profileBox = Hive.box('profileBox');

  String? getLocalAvatarPath() {
    return _profileBox.get('avatar_path');
  }

  Future<String?> pickAndSaveAvatar() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final String fileName =
          'avatar_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final String savedPath = '${directory.path}/$fileName';

      final File localImage = await File(pickedFile.path).copy(savedPath);
      await _profileBox.put('avatar_path', localImage.path);

      return localImage.path; 
    }
    return null;
  }

  Future<void> updateUserName(String newName) async {
    try {
      await _supabase.auth.updateUser(UserAttributes(data: {'full_name': newName}));
      
    } catch (e) {
      throw Exception('Gagal mengubah nama: $e');
    }
  }

  Future<void> deleteAccount() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) {
        throw Exception('Pengguna tidak ditemukan.');
      }

      await _supabase.rpc('delete_user');

      await _supabase.auth.signOut(scope: SignOutScope.local);

      await Hive.box('personalNoteBox').clear();
      await Hive.box('profileBox').clear();
      await Hive.box('personalDraftBox').clear();
      await Hive.box('calculationHistoryBox').clear();
      await Hive.box('progressBox').clear();
    } catch (e) {
      throw Exception('Gagal menghapus akun: $e');
    }
  }
}
