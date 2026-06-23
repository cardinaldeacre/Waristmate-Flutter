import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waristmate_app/controllers/personal_note_controller.dart';
import 'package:waristmate_app/core/config/theme.dart';
import 'package:waristmate_app/widgets/note/dynamic_item_card.dart';
import 'package:waristmate_app/widgets/ui/input_label.dart';
import 'package:waristmate_app/widgets/ui/custom_text_field.dart';
import 'package:waristmate_app/widgets/note/add_item_card.dart';
import 'package:waristmate_app/logic/note_item.dart';

class NoteCard extends StatefulWidget {
  final bool isEditMode;

  const NoteCard({super.key, required this.isEditMode});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  final List<DynamicItemModel> _asetList = [];
  final List<DynamicItemModel> _debtList = [];

  @override
  void initState() {
    super.initState();
    _asetList.add(DynamicItemModel());
    _debtList.add(DynamicItemModel());
  }

  @override
  void dispose() {
    for (var item in _asetList) {
      item.dispose();
    }
    super.dispose();
  }

  void _addAset() {
    setState(() {
      _asetList.add(DynamicItemModel());
    });
  }

  void _removeAset(int index) {
    setState(() {
      _asetList[index].dispose();
      _asetList.removeAt(index);
    });
  }

  void _addDebt() {
    setState(() {
      _debtList.add(DynamicItemModel());
    });
  }

  void _removeDebt(int index) {
    setState(() {
      _debtList[index].dispose();
      _debtList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final noteController = Provider.of<NoteController>(context);

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
                    const InputLabel(label: "Harta yang saya tinggalkan"),
                    CustomTextField(
                      label: "Total Harta",
                      isCurrency: true,
                      onChanged: (val) {
                        String cleanVal = val
                            .replaceAll('.', '')
                            .replaceAll(',', '');
                      },
                    ),

                    const InputLabel(label: "Total Hutang Terkini"),
                    CustomTextField(
                      label: "Total Hutang",
                      isCurrency: true,
                      onChanged: (val) {
                        String cleanVal = val
                            .replaceAll('.', '')
                            .replaceAll(',', '');
                      },
                    ),

                    const InputLabel(label: "Warisan Untuk Dibagikan (1/3)"),
                    CustomTextField(
                      label: "Total Hutang",
                      isCurrency: true,
                      onChanged: (val) {
                        String cleanVal = val
                            .replaceAll('.', '')
                            .replaceAll(',', '');
                        int parsedVal = int.tryParse(cleanVal) ?? 0;
                        // noteController.setHutang(parsedVal);
                      },
                    ),

                    const SizedBox(height: 16),
                    const InputLabel(label: "Aset Tunai"),

                    ..._asetList.map(
                      (item) => DynamicItemCard(
                        isEditMode: widget.isEditMode,
                        nameController: item.nameController,
                        amountController: item.amountController,
                        nameHint: "Nama Aset",
                        onRemove: () {
                          _removeAset(_asetList.indexOf(item));
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    if (widget.isEditMode)
                      AddItemCard(
                        onAdd: () {
                          _addAset();
                        },
                        label: "Tambah Aset Tunai",
                      ),

                    if (widget.isEditMode)
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primaryGreen,
                          side: const BorderSide(color: AppColors.primaryGreen),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.add),
                        label: const Text("Tambah Aset"),
                        onPressed: () {
                          print("Tambah row aset");
                        },
                      ),

                    const InputLabel(label: "Hutang"),

                    ..._debtList.map(
                      (item) => DynamicItemCard(
                        isEditMode: widget.isEditMode,
                        nameController: item.nameController,
                        amountController: item.amountController,
                        nameHint: "Nama Hutang",
                        onRemove: () {
                          _removeDebt(_debtList.indexOf(item));
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    if (widget.isEditMode)
                      AddItemCard(
                        onAdd: () {
                          _addDebt();
                        },
                        label: "Tambah Hutang",
                      ),

                    if (widget.isEditMode)
                      OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primaryGreen,
                          side: const BorderSide(color: AppColors.primaryGreen),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.add),
                        label: const Text("Tambah Hutang"),
                        onPressed: () {
                          print("Tambah row hutang");
                        },
                      ),

                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 16),

                    const InputLabel(label: "Catatan & wasiat"),

                    const SizedBox(height: 12),

                    if (!widget.isEditMode)
                      const Text(
                        "Tolong bagikan warisan sesuai syariat. Untuk Yono, hutangnya tolong dilunasi dari emas yang ada.",
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.textDark,
                          height: 1.5,
                        ),
                      )
                    else
                      TextFormField(
                        initialValue:
                            "Tolong bagikan warisan sesuai syariat. Untuk Yono, hutangnya tolong dilunasi dari emas yang ada.",
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText:
                              "Tuliskan pesan atau rincian wasiat di sini...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
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
