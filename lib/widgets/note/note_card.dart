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
    final bool hasValidAssets = noteController.nonCashAssets.any(
      (item) =>
          item.nameController.text.trim().isNotEmpty &&
          item.amountController.text.trim().isNotEmpty,
    );
    final bool hasValidHutang = noteController.debtList.any(
      (item) =>
          item.nameController.text.trim().isNotEmpty &&
          item.amountController.text.trim().isNotEmpty,
    );

    return Expanded(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            NoteInfo(),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
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

                    const Text(
                      "(Silahkan isi bagian ini untuk mencatat aset dan hutang Anda)",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const InputLabel(label: "Total aset tunai terkini"),
                    CustomTextField(
                      isCurrency: true,
                      readOnly: !widget.isEditMode,
                      autofillHints: "500.000.000",
                      controller: noteController.cashAssetController,
                      onChanged: (val) {
                        String cleanVal = val
                            .replaceAll('.', '')
                            .replaceAll(',', '');
                        int parsedVal = int.tryParse(cleanVal) ?? 0;
                        noteController.setCashAsset(parsedVal);
                      },
                    ),

                    const SizedBox(height: 16),
                    const InputLabel(label: "Daftar aset non-tunai terkini"),

                    if (widget.isEditMode || hasValidAssets) ...[
                      ...noteController.nonCashAssets
                          .asMap()
                          .entries
                          .where((entry) {
                            if (widget.isEditMode) return true;

                            final item = entry.value;
                            return item.nameController.text.trim().isNotEmpty ||
                                item.amountController.text.trim().isNotEmpty;
                          })
                          .map((entry) {
                            final index = entry.key;
                            final item = entry.value;

                            return DynamicItemCard(
                              isEditMode: widget.isEditMode,
                              nameController: item.nameController,
                              amountController: item.amountController,
                              nameHint: "Emas 20gr",
                              amountHint: "54.000.000",
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

                    const InputLabel(label: "Hutang yang saya miliki"),

                    if (widget.isEditMode || hasValidHutang) ...[
                      ...noteController.debtList
                          .asMap()
                          .entries
                          .where((entry) {
                            if (widget.isEditMode) return true;

                            final item = entry.value;
                            return item.nameController.text.trim().isNotEmpty ||
                                item.amountController.text.trim().isNotEmpty;
                          })
                          .map((entry) {
                            final index = entry.key;
                            final item = entry.value;

                            return DynamicItemCard(
                              isEditMode: widget.isEditMode,
                              nameController: item.nameController,
                              amountController: item.amountController,
                              nameHint: "Hutang ke Fulan",
                              amountHint: "700.000",
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
                    const SizedBox(height: 16),

                    const Text(
                      "(Apabila nominal melebihi batas maksimal (1/3) maka nominal akan otomatis disesuaikan)",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const InputLabel(label: "Warisan untuk dibagikan (1/3)"),
                    CustomTextField(
                      controller: noteController.wasiatController,
                      isCurrency: true,
                      readOnly: !widget.isEditMode,
                      autofillHints: widget.isEditMode ? '0' : null,
                      onChanged: (val) {
                        String cleanVal = val
                            .replaceAll('.', '')
                            .replaceAll(',', '');
                        int parsedVal = int.tryParse(cleanVal) ?? 0;

                        String? notip = noteController.updateWasiat(parsedVal);
                        if (notip != null) {
                          noteController.wasiatController.text = noteController
                              .wasiatNominal
                              .toString();
                          noteController
                              .wasiatController
                              .selection = TextSelection.fromPosition(
                            TextPosition(
                              offset:
                                  noteController.wasiatController.text.length,
                            ),
                          );

                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(notip),
                              backgroundColor: Colors.red[700],
                              duration: const Duration(seconds: 3),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height - 17.50,
                                left: 20,
                                right: 20,
                              ),
                            ),
                          );
                        }
                      },
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

                    const InputLabel(
                      label: "Catatan seputar warisan dan wasiat",
                    ),

                    const SizedBox(height: 12),

                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundClean,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextFormField(
                        controller: noteController.wasiatNoteController,
                        readOnly: !widget.isEditMode,
                        maxLines: 12,
                        onChanged: (val) {
                          noteController.setWasiatNote(val);
                        },
                        style: const TextStyle(color: AppColors.primaryGreen),
                        decoration: InputDecoration(
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
            ),
          ],
        ),
      ),
    );
  }
}
