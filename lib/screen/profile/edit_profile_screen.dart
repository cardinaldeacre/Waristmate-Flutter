import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/personal_note_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/screen/main_wrapper.dart';
import 'package:waristmate_app/services/personal_note/personal_note_service.dart';
import 'dart:io';
import 'package:waristmate_app/services/profile/user_profile_service.dart';
import 'package:waristmate_app/widgets/ui/custom_alert.dart';
import 'package:waristmate_app/widgets/ui/message_snackbar.dart';

class EditProfileScreen extends StatefulWidget {
  final String initialName;
  final String avatarUrl;

  const EditProfileScreen({super.key, required this.initialName, required this.avatarUrl});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final UserProfileService profileService = UserProfileService();
  final TextEditingController nameController = TextEditingController();

  String? localAvatarPath;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    localAvatarPath = profileService.getLocalAvatarPath();
    nameController.text = widget.initialName;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  ImageProvider getAvatarImage() {
    if (localAvatarPath != null && localAvatarPath!.isNotEmpty) {
      final file = File(localAvatarPath!);
      if (file.existsSync()) {
        return FileImage(file);
      }
    }

    if (widget.avatarUrl.isNotEmpty) {
      return NetworkImage(widget.avatarUrl);
    }

    return const AssetImage('assets/images/user.png');
  }

  Future<void> updateAvatar() async {
    final newPath = await profileService.pickAndSaveAvatar();
    if (newPath != null) {
      setState(() {
        localAvatarPath = newPath;
      });
    }
  }

  Future<void> saveChanges() async {
    if (nameController.text.trim().isEmpty) return;

    setState(() => isLoading = true);
    try {
      await profileService.updateUserName(nameController.text.trim());
      if (!mounted) return;
      showMessageSnackbar(context, 'Nama berhasil diubah', AppColors.primaryGreen);
    } catch (e) {
      showMessageSnackbar(context, 'Gagal mengubah nama: $e', AppColors.errorRed);
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  Future<void> confirmDeleteAccount() async {
    await showDialog<void>(
      context: context,
      builder: (context) => CustomAlert(
        title: 'Hapus Akun Permanen?',
        message:
            'Tindakan ini tidak bisa dibatalkan. Semua data catatan dan pengaturan Anda akan musnah tanpa sisa.',
        icon: Icons.warning_amber_rounded,
        iconColor: AppColors.errorRed,
        cancelText: 'Batal',
        confirmText: 'Hapus',
        confirmColor: AppColors.errorRed,
        onCancel: () {},
        onConfirm: _deleteAccount,
      ),
    );
  }

  Future<void> _deleteAccount() async {
    setState(() => isLoading = true);
    try {
      await profileService.deleteAccount();
      if (!mounted) return;

      final noteController = context.read<PersonalNoteController>();

      await PersonalNoteService().clearLocalData();
      noteController.clearForm();
      noteController.clearState();

      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MainWrapper()),
        (route) => false,
      );

      showMessageSnackbar(
        context,
        'Akun berhasil dihapus',
        AppColors.primaryGreen,
      );
    } catch (e) {
      if (!mounted) return;
      showMessageSnackbar(context, 'Gagal menghapus akun: $e', AppColors.errorRed);
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundClean,
      appBar: AppBar(
        title: const Text(
          'Edit Profil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shadowColor: AppColors.darkShadow.withAlpha(200),
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: AppColors.textLight,
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(24),
              children: [
                // Bagian Avatar
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primaryGreen, width: 4),
                        ),
                        child: CircleAvatar(
                          radius: 56,
                          backgroundImage: getAvatarImage(),
                          backgroundColor: AppColors.darkGreen,
                        ),
                      ),
                      Container(
                        decoration:  BoxDecoration(
                          color: AppColors.gold,
                          shape: BoxShape.circle,
                            border: Border.all(
                            color: AppColors.textLight,
                            width: 2,
                          ),

                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.edit_rounded,
                          color: AppColors.textLight,
                          ),
                          onPressed: updateAvatar,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                const Text(
                  'Nama Lengkap',
                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryGreen),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Masukkan nama Anda',
                  ),
                    style: const TextStyle(fontSize: 16, color: AppColors.textDark),
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: saveChanges,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Simpan Perubahan',
                    style: TextStyle(fontSize: 16, color: AppColors.textLight),
                  ),
                ),
                const SizedBox(height: 60),

                const Divider(),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: confirmDeleteAccount,
                  icon: const Icon(
                    Icons.warning_amber_rounded,
                    color: AppColors.errorRed,
                  ),
                  label: const Text(
                    'Hapus Akun Permanen',
                    style: TextStyle(color: AppColors.errorRed),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.withAlpha(25),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
