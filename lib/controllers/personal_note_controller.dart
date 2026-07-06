import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/logic/note_item.dart';
import 'package:waristmate_app/models/note_item.dart';
import 'package:waristmate_app/models/personal_note.dart';
import 'package:waristmate_app/services/personal_note/personal_note_draft_service.dart';
import 'package:waristmate_app/services/personal_note/personal_note_service.dart';
import 'dart:async';

class PersonalNoteController extends ChangeNotifier {
  final PersonalNoteService _personalNoteService = PersonalNoteService();
  final PersonalNoteDraftService _draftService = PersonalNoteDraftService();
  final wasiatController = TextEditingController();
  final warisanNoteController = TextEditingController();
  final cashAssetController = TextEditingController();

  int cashAssetNominal = 0;
  int wasiatNominal = 0;
  String warisanNote = '';

  List<DynamicItemModel> assetInputs = [DynamicItemModel()];
  List<DynamicItemModel> debtInputs = [DynamicItemModel()];
  List<DynamicItemModel> wasiatInputs = [DynamicItemModel()];

  List<DynamicItemModel> _buildDynamicItems(List<NoteItemModel> items) {
    if (items.isEmpty) {
      return [DynamicItemModel()];
    }

    return items.map((item) {
      return DynamicItemModel(
        name: item.name,
        description: item.description,
        amount: item.amount.toString(),
      );
    }).toList();
  }

  PersonalNoteModel buildPersonalNote(String userId) {
    return PersonalNoteModel(
      userId: userId,
      totalAssetsNominal: totalAssetsNominal,
      totalDebtsNominal: totalDebtsNominal,
      totalWasiatNominal: totalWasiatNominal,
      assetList: assetInputs
          .where(
            (e) =>
                e.nameController.text.trim().isNotEmpty ||
                parseRupiah(e.amountController.text) > 0 ||
                e.descriptionController.text.trim().isNotEmpty,
          )
          .map(
            (e) => NoteItemModel(
              name: e.nameController.text.trim(),
              description: e.descriptionController.text.trim(),
              amount: parseRupiah(e.amountController.text),
            ),
          )
          .toList(),

      debtList: debtInputs
          .where(
            (e) =>
                e.nameController.text.trim().isNotEmpty ||
                parseRupiah(e.amountController.text) > 0 ||
                e.descriptionController.text.trim().isNotEmpty,
          )
          .map(
            (e) => NoteItemModel(
              name: e.nameController.text.trim(),
              description: e.descriptionController.text.trim(),
              amount: parseRupiah(e.amountController.text),
            ),
          )
          .toList(),

      wasiatList: wasiatInputs
          .where(
            (e) =>
                e.nameController.text.trim().isNotEmpty ||
                parseRupiah(e.amountController.text) > 0 ||
                e.descriptionController.text.trim().isNotEmpty,
          )
          .map(
            (e) => NoteItemModel(
              name: e.nameController.text.trim(),
              description: e.descriptionController.text.trim(),
              amount: parseRupiah(e.amountController.text),
            ),
          )
          .toList(),

      warisanNote: warisanNoteController.text.trim(),
    );
  }

  Timer? _draftTimer;
  bool isLoading = false;
  bool isEditMode = false;
  bool get isEditModeEnabled => isEditMode;
  bool hasDraft(String userId) {
    return _draftService.hasDraft(userId);
  }

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

  void clearForm() {
    cashAssetNominal = 0;

    warisanNoteController.clear();

    for (final item in assetInputs) {
      item.dispose();
    }

    for (final item in debtInputs) {
      item.dispose();
    }

    for (final item in wasiatInputs) {
      item.dispose();
    }

    assetInputs = [DynamicItemModel()];
    debtInputs = [DynamicItemModel()];
    wasiatInputs = [DynamicItemModel()];

    notifyListeners();
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

  void fillFromModel(PersonalNoteModel model) {
    cashAssetNominal =
        (model.totalAssetsNominal ?? 0) -
        model.assetList.fold(0, (sum, item) => sum + item.amount);

    warisanNoteController.text = model.warisanNote ?? '';

    assetInputs = _buildDynamicItems(model.assetList);

    debtInputs = _buildDynamicItems(model.debtList);

    wasiatInputs = _buildDynamicItems(model.wasiatList);

    notifyListeners();
  }

  Future<void> savePersonalNote(String userId) async {
    isLoading = true;
    notifyListeners();

    try {
      final note = buildPersonalNote(userId);

      await _personalNoteService.savePersonalNote(note);

      await deleteDraft(userId);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getPersonalNote() async {
    isLoading = true;

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
        fillFromModel(personalNote);
      }

      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch personal note: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveDraft() async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) return;
    print("SAVE DRAFT");
    final note = buildPersonalNote(user.id);

    await _draftService.saveDraft(note);
  }

  Future<void> deleteDraft(String userId) async {
    await _draftService.deleteDraft(userId);
  }

  Future<void> loadDraft(String userId) async {
    final draft = _draftService.loadDraft(userId);

    if (draft == null) return;

    fillFromModel(draft);
  }

  Future<void> scheduleAutoSaveDraft() async {
    _draftTimer?.cancel();
    _draftTimer = Timer(const Duration(seconds: 2), () async {
      await saveDraft();
    });
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
    _draftTimer?.cancel();
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
