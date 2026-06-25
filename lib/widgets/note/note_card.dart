import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/personal_note_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/note/dynamic_item_card.dart';
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
                    const InputLabel(label: "Total harta bersih"),
                    CustomTextField(
                      label: "Total Harta",
                      isCurrency: true,
                      readOnly: true,
                      controller: TextEditingController(
                        text: noteController
                            .formatRupiah(noteController.estimasiHartaBersih)
                            .replaceAll('Rp ', ''),
                      ),
                    ),

                    const InputLabel(label: "Total harta yang saya tinggalkan"),
                    CustomTextField(
                      label: "Total Harta",
                      isCurrency: true,
                      readOnly: true,
                      controller: TextEditingController(
                        text: noteController
                            .formatRupiah(noteController.totalAssetsNominal)
                            .replaceAll('Rp ', ''),
                      ),
                    ),

                    const InputLabel(label: "Total hutang terkini"),
                    CustomTextField(
                      label: "Total Hutang",
                      isCurrency: true,
                      readOnly: true,
                      controller: TextEditingController(
                        text: noteController
                            .formatRupiah(noteController.totalDebtsNominal)
                            .replaceAll('Rp ', ''),
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Divider(height: 1, color: Colors.white24),

                    const InputLabel(label: "Total aset tunai"),
                    CustomTextField(
                      label: "Total Aset Tunai",
                      isCurrency: true,
                      readOnly: !widget.isEditMode,
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
                    const InputLabel(label: "Daftar aset non-tunai"),

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
                              nameHint: "Nama Aset",
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
                              nameHint: "Nama Hutang",
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

                    const InputLabel(label: "Warisan untuk dibagikan (1/3)"),
                    CustomTextField(
                      label: "Wasiat (maksimal 1/3 sisa harta)",
                      controller: noteController.wasiatController,
                      isCurrency: true,
                      readOnly: !widget.isEditMode,
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

                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 16),

                    const InputLabel(
                      label: "Catatan seputar warisan dan wasiat",
                    ),

                    const SizedBox(height: 12),

                    if (!widget.isEditMode)
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundClean,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          readOnly: true,
                          initialValue: noteController.wasiatNote,
                          maxLines: 6,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.backgroundClean,

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
                      )
                    else
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundClean,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          initialValue: noteController.wasiatNote,
                          maxLines: 6,
                          onChanged: (val) {
                            noteController.setWasiatNote(val);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.backgroundClean,

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
                    const SizedBox(height: 40),
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
