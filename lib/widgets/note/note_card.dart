import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/personal_note_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/note/dynamic_item_card.dart';
import 'package:waristmate_app/widgets/note/note_info.dart';
import 'package:waristmate_app/widgets/ui/input_label.dart';
import 'package:waristmate_app/widgets/ui/custom_text_field.dart';
import 'package:waristmate_app/widgets/note/add_item_card.dart';

class NoteCard extends StatefulWidget {
  final bool isEditMode;

  const NoteCard({super.key, required this.isEditMode});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    final noteController = context.watch<PersonalNoteController>();
    final bool hasValidAssets = noteController.assetInputs.any(
      (item) =>
          item.nameController.text.trim().isNotEmpty &&
          item.amountController.text.trim().isNotEmpty &&
          item.descriptionController.text.trim().isNotEmpty,
    );
    final bool hasValidHutang = noteController.debtInputs.any(
      (item) =>
          item.nameController.text.trim().isNotEmpty &&
          item.amountController.text.trim().isNotEmpty &&
          item.descriptionController.text.trim().isNotEmpty,
    );
    final bool hasValidWasiat = noteController.wasiatInputs.any(
      (item) =>
          item.nameController.text.trim().isNotEmpty &&
          item.amountController.text.trim().isNotEmpty &&
          item.descriptionController.text.trim().isNotEmpty,
    );

    if (noteController.wasiatWarning != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              noteController.wasiatWarning!,
              style: TextStyle(color: AppColors.textLight),
            ),
            backgroundColor: AppColors.errorRed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      });
    }

    return Column(
      children: [
        NoteInfo(),

        const SizedBox(height: 20),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primaryGreen,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              const Text(
                "(Bagian ini tidak perlu diisi, akan dihitung otomatis)",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const InputLabel(label: "Total harta yang saya tinggalkan"),
              CustomTextField(
                isCurrency: true,
                readOnly: true,
                color: AppColors.gold,
                controller: TextEditingController(
                  text: noteController
                      .formatRupiah(noteController.totalAssetsNominal)
                      .replaceAll('Rp ', ''),
                ),
              ),

              const InputLabel(label: "Total hutang terkini"),
              CustomTextField(
                isCurrency: true,
                readOnly: true,
                color: AppColors.errorRed,
                controller: TextEditingController(
                  text: noteController
                      .formatRupiah(noteController.totalDebtsNominal)
                      .replaceAll('Rp ', ''),
                ),
              ),

              const InputLabel(label: "Total wasiat (1/3) yang saya tuliskan"),
              CustomTextField(
                isCurrency: true,
                readOnly: true,
                color: AppColors.errorRed,
                controller: TextEditingController(
                  text: noteController
                      .formatRupiah(noteController.totalWasiatNominal)
                      .replaceAll('Rp ', ''),
                ),
              ),

              const InputLabel(label: "Total harta bersih"),
              CustomTextField(
                isCurrency: true,
                readOnly: true,
                color: AppColors.primaryGreen,
                controller: TextEditingController(
                  text: noteController
                      .formatRupiah(noteController.estimasiHartaBersih)
                      .replaceAll('Rp ', ''),
                ),
              ),

              const SizedBox(height: 16),
              const Divider(height: 1, color: AppColors.textLight),
              const SizedBox(height: 16),
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primaryGreen,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              const Text(
                "(Silahkan isi bagian ini untuk mencatat aset dan hutang Anda)",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),
              const Divider(height: 1, color: AppColors.textLight),

              const InputLabel(label: "Daftar aset terkini"),
              if (widget.isEditMode)
                const Text(
                  "(Bisa berisi aset tunai maupun non-tunai, misal: tabungan, emas, tanah, rumah, dsb.)",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

              if (!widget.isEditMode && !hasValidAssets)
                const Text(
                  "(Belum ada aset yang dicatat)",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

              if (widget.isEditMode || hasValidAssets) ...[
                ...noteController.assetInputs
                    .asMap()
                    .entries
                    .where((entry) {
                      if (widget.isEditMode) return true;

                      final item = entry.value;
                      return item.nameController.text.trim().isNotEmpty ||
                          item.amountController.text.trim().isNotEmpty ||
                          item.descriptionController.text.trim().isNotEmpty;
                    })
                    .map((entry) {
                      final index = entry.key;
                      final item = entry.value;

                      return DynamicItemCard(
                        isEditMode: widget.isEditMode,
                        nameController: item.nameController,
                        amountController: item.amountController,
                        descriptionController: item.descriptionController,
                        nameHint: "Emas 20gr",
                        amountHint: "54.000.000",
                        descriptionHint: "Deskripsi aset",
                        isAsset: true,
                        onRemove: () {
                          noteController.removeAssetRow(index);
                        },
                        onChanged: (val) {
                          noteController.updateCalculation();
                        },
                      );
                    }),
              ],

              const SizedBox(height: 16),

              if (widget.isEditMode)
                AddItemCard(
                  onAdd: () {
                    noteController.addAssetRow();
                  },
                  label: "Tambah Aset",
                ),

              const SizedBox(height: 16),
              const Divider(height: 1, color: AppColors.textLight),

              const InputLabel(label: "Hutang yang saya miliki"),
              if (widget.isEditMode)
                const Text(
                  "(Bisa berisi hutang tunai maupun non-tunai, misal: hutang kepada A, tagihan bank, cicilan, dsb.)",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

              if (!widget.isEditMode && !hasValidHutang)
                const Text(
                  "(Belum ada hutang yang dicatat)",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

              if (widget.isEditMode || hasValidHutang) ...[
                ...noteController.debtInputs
                    .asMap()
                    .entries
                    .where((entry) {
                      if (widget.isEditMode) return true;

                      final item = entry.value;
                      return item.nameController.text.trim().isNotEmpty ||
                          item.amountController.text.trim().isNotEmpty ||
                          item.descriptionController.text.trim().isNotEmpty;
                    })
                    .map((entry) {
                      final index = entry.key;
                      final item = entry.value;

                      return DynamicItemCard(
                        isEditMode: widget.isEditMode,
                        nameController: item.nameController,
                        amountController: item.amountController,
                        descriptionController: item.descriptionController,
                        nameHint: "Hutang ke Fulan",
                        amountHint: "700.000",
                        descriptionHint: "Deskripsi hutang",
                        isAsset: false,
                        onRemove: () {
                          noteController.removeDebtRow(index);
                        },
                        onChanged: (val) {
                          noteController.updateCalculation();
                        },
                      );
                    }),
              ],

              const SizedBox(height: 16),

              if (widget.isEditMode)
                AddItemCard(
                  onAdd: () {
                    noteController.addDebtRow();
                  },
                  label: "Tambah Hutang",
                ),

              const SizedBox(height: 16),
              const Divider(height: 1, color: AppColors.textLight),

              const InputLabel(label: "Daftar wasiat"),
              if (widget.isEditMode)
                const Text(
                  "(Bisa berisi wasiat tunai maupun non-tunai, misal: wasiat kepada B, harta yang ditinggalkan, dll)",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

              if (!widget.isEditMode && !hasValidWasiat)
                const Text(
                  "(Belum ada wasiat yang dicatat)",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),

              if (widget.isEditMode || hasValidWasiat) ...[
                ...noteController.wasiatInputs
                    .asMap()
                    .entries
                    .where((entry) {
                      if (widget.isEditMode) return true;

                      final item = entry.value;
                      return item.nameController.text.trim().isNotEmpty ||
                          item.amountController.text.trim().isNotEmpty ||
                          item.descriptionController.text.trim().isNotEmpty;
                    })
                    .map((entry) {
                      final index = entry.key;
                      final item = entry.value;

                      return DynamicItemCard(
                        isEditMode: widget.isEditMode,
                        nameController: item.nameController,
                        descriptionController: item.descriptionController,
                        amountController: item.amountController,
                        nameHint: "Pembangunan Masjid",
                        descriptionHint: "Deskripsi wasiat",
                        amountHint: "5.000.000",
                        isAsset: true,
                        onRemove: () {
                          noteController.removeWasiatRow(index);
                        },
                        onChanged: (_) {
                          noteController.updateCalculation();
                        },
                      );
                    }),
              ],

              const SizedBox(height: 16),

              if (widget.isEditMode)
                AddItemCard(
                  onAdd: () {
                    noteController.addWasiatRow();
                  },
                  label: "Tambah Wasiat",
                ),

              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 12),

              const Text(
                "(Silahkan isi bagian ini untuk mencatat catatan seputar warisan dan wasiat Anda)",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const InputLabel(label: "Catatan seputar warisan dan wasiat"),

              const SizedBox(height: 12),

              Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundClean,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  controller: noteController.warisanNoteController,
                  readOnly: !widget.isEditMode,

                  maxLines: 12,
                  onChanged: (val) {
                    noteController.setWarisanNote(val);
                  },
                  style: const TextStyle(color: AppColors.primaryGreen),
                  decoration: InputDecoration(
                    hintText:
                        'Tuliskan catatan untuk para pewaris Anda di sini...',
                    hintStyle: const TextStyle(color: AppColors.darkGrey),
                    filled: true,
                    fillColor: AppColors.backgroundClean,
                    contentPadding: const EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.primaryGreen,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
