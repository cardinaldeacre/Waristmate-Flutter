import 'package:flutter/material.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ProfileCard extends StatefulWidget {
  final String name;
  final String avatarUrl;
  final bool isLoggedIn;

  const ProfileCard({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.isLoggedIn,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  String? _localAvatarPath;
  final _profileBox = Hive.box('profileBox');

  @override
  void initState() {
    super.initState();
    _localAvatarPath = _profileBox.get('avatar_path');
  }

  Future<void> _pickAndSaveImage() async {
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

      setState(() {
        _localAvatarPath = localImage.path;
      });
    }
  }

  ImageProvider _getAvatarImage(String? googleAvatarUrl) {
    // hive
    if (_localAvatarPath != null && _localAvatarPath!.isNotEmpty) {
      final file = File(_localAvatarPath!);
      if (file.existsSync()) {
        return FileImage(file);
      }
    }

    if (googleAvatarUrl != null && googleAvatarUrl.isNotEmpty) {
      return NetworkImage(googleAvatarUrl);
    }

    return const AssetImage('assets/images/user.png');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: CircleAvatar(
                  radius: 56,
                  backgroundImage: _getAvatarImage(widget.avatarUrl),
                  backgroundColor: AppColors.darkGreen,
                ),
              ),

              if (widget.isLoggedIn)
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.edit, size: 20),
                    color: Colors.white,
                    onPressed: _pickAndSaveImage,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            widget.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
