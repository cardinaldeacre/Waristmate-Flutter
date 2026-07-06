import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/logic/note_item.dart';
import 'package:waristmate_app/models/note_item.dart';
import 'package:waristmate_app/models/personal_note.dart';
import 'package:waristmate_app/services/personal_note/personal_note_service.dart';

class PersonalNoteController extends ChangeNotifier {
  final PersonalNoteService _personalNoteService = PersonalNoteService();
  final wasiatController = TextEditingController();
  final warisanNoteController = TextEditingController();
  final cashAssetController = TextEditingController();

  int cashAssetNominal = 0;
  int wasiatNominal = 0;
  String warisanNote = '';

  List<DynamicItemModel> assetInputs = [DynamicItemModel()];
  List<DynamicItemModel> debtInputs = [DynamicItemModel()];
  List<DynamicItemModel> wasiatInputs = [DynamicItemModel()];

  List<NoteItemModel> _mapItems(List<DynamicItemModel> items) {
    return items
        .where(
          (item) =>
              item.nameController.text.trim().isNotEmpty &&
              parseRupiah(item.amountController.text) > 0,
        )
        .map(
          (item) => NoteItemModel(
            name: item.nameController.text.trim(),
            amount: parseRupiah(item.amountController.text),
            description: item.descriptionController.text.trim(),
          ),
        )
        .toList();
  }

  bool isLoading = false;
  bool isEditMode = false;

  bool get isEditModeEnabled => isEditMode;

  void setEditMode(bool value) {
    isEditMode = value;
    notifyListeners();
  }

  int parseRupiah(String value) {
    if (value.isEmpty) return 0;
    final cleanedValue = value.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(cleanedValue) ?? 0;
  }

  int get totalNonCashAssets {
    return assetInputs.fold(
      0,
      (sum, item) => sum + parseRupiah(item.amountController.text),
    );
  }

  int get totalAssetsNominal {
    return cashAssetNominal + totalNonCashAssets;
  }

  int get totalDebtsNominal {
    return debtInputs.fold(
      0,
      (sum, item) => sum + parseRupiah(item.amountController.text),
    );
  }

  int get totalWasiatNominal {
    return wasiatInputs.fold(
      0,
      (sum, item) => sum + parseRupiah(item.amountController.text),
    );
  }

  int get estimasiHartaBersih {
    return totalAssetsNominal - totalDebtsNominal;
  }

  int get maksimalWasiat {
    if (estimasiHartaBersih <= 0) return 0;
    return estimasiHartaBersih ~/ 3;
  }

  bool get isWasiatExceeded {
    return wasiatNominal > maksimalWasiat;
  }

  int get selisihWasiat {
    if (isWasiatExceeded) {
      return wasiatNominal - maksimalWasiat;
    }
    return 0;
  }

  void setCashAsset(int value) {
    cashAssetNominal = value;
    notifyListeners();
  }

  void setWarisanNote(String note) {
    warisanNote = note;
    notifyListeners();
  }

  String? get wasiatWarning {
    if (!isWasiatExceeded) return null;

    return "Total wasiat melebihi batas maksimal 1/3 harta bersih (${formatRupiah(maksimalWasiat)}). "
        "Silakan kurangi sebesar ${formatRupiah(selisihWasiat)}.";
  }

  bool get canSave {
    return !isWasiatExceeded && !isLoading;
  }

  void addAssetRow() {
    assetInputs.add(DynamicItemModel());
    notifyListeners();
  }

  void removeAssetRow(int index) {
    assetInputs[index].dispose();
    assetInputs.removeAt(index);
    notifyListeners();
  }

  void addDebtRow() {
    debtInputs.add(DynamicItemModel());
    notifyListeners();
  }

  void removeDebtRow(int index) {
    debtInputs[index].dispose();
    debtInputs.removeAt(index);
    notifyListeners();
  }

  void addWasiatRow() {
    wasiatInputs.add(DynamicItemModel());
    notifyListeners();
  }

  void removeWasiatRow(int index) {
    wasiatInputs[index].dispose();
    wasiatInputs.removeAt(index);
    notifyListeners();
  }

  void updateCalculation() {
    notifyListeners();
  }

  void _loadItems(List<DynamicItemModel> target, List<NoteItemModel> source) {
    for (final item in target) {
      item.dispose();
    }

    target
      ..clear()
      ..addAll(
        source.map(
          (e) => DynamicItemModel(
            name: e.name,
            amount: e.amount.toString(),
            description: e.description,
          ),
        ),
      );

    if (target.isEmpty) {
      target.add(DynamicItemModel());
    }
  }

  Future<void> savePersonalNote(String userId) async {
    isLoading = true;

    try {
      updateCalculation();

      final personalNote = PersonalNoteModel(
        userId: userId,
        totalAssetsNominal: totalAssetsNominal,
        totalDebtsNominal: totalDebtsNominal,
        totalWasiatNominal: totalWasiatNominal,
        assetList: _mapItems(assetInputs),
        debtList: _mapItems(debtInputs),
        wasiatList: _mapItems(wasiatInputs),
        warisanNote: warisanNote,
      );

      await _personalNoteService.savePersonalNote(personalNote);
    } catch (e) {
      throw Exception('Failed to save personal note: $e');
    } finally {
      notifyListeners();
      isLoading = false;
    }
  }

  Future<void> getPersonalNote() async {
    isLoading = true;
    notifyListeners();

    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      notifyListeners();
      isLoading = false;
      throw Exception('User not logged in');
    }

    final userId = user.id;

    try {
      final personalNote = await _personalNoteService.getPersonalNote(userId);

      if (personalNote != null) {
        assetInputs.clear();
        _loadItems(assetInputs, personalNote.assetList);

        debtInputs.clear();
        _loadItems(debtInputs, personalNote.debtList);

        wasiatInputs.clear();
        _loadItems(wasiatInputs, personalNote.wasiatList);
      }

      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch personal note: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String formatRupiah(int value) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(value);
  }

  @override
  void dispose() {
    wasiatController.dispose();
    warisanNoteController.dispose();
    cashAssetController.dispose();

    for (var item in assetInputs) {
      item.dispose();
    }
    for (var item in debtInputs) {
      item.dispose();
    }
    for (var item in wasiatInputs) {
      item.dispose();
    }
    super.dispose();
  }
}
