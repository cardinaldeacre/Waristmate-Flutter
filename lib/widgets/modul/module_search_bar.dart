import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/materi_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';

class ModuleSearchBar extends StatelessWidget {
  const ModuleSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final materiCtrl = context.watch<MateriController>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
      child: TextField(
        onChanged: materiCtrl.searchModules,
        decoration: InputDecoration(
          hintText: "Cari materi...",
          prefixIcon: const Icon(Icons.search),

          suffixIcon: materiCtrl.searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    materiCtrl.clearSearch();
                    FocusScope.of(context).unfocus();
                  },
                )
              : null,

          filled: true,
          fillColor: Colors.white,

          contentPadding: const EdgeInsets.symmetric(vertical: 12),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: AppColors.primaryGreen.withAlpha(40)),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.primaryGreen),
          ),
        ),
      ),
    );
  }
}
