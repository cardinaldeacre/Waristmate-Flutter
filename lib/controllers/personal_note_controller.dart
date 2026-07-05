import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waristmate_app/logic/note_item.dart';
import 'package:waristmate_app/models/personal_note.dart';
import 'package:waristmate_app/services/personal_note/personal_note_service.dart';

class PersonalNoteController extends ChangeNotifier {
  final PersonalNoteService _personalNoteService = PersonalNoteService();
  final wasiatController = TextEditingController();
  final wasiatNoteController = TextEditingController();
  final cashAssetController = TextEditingController();

  int cashAssetNominal = 0;
  int wasiatNominal = 0;
  String wasiatNote = '';

  List<DynamicItemModel> nonCashAssets = [DynamicItemModel()];
  List<DynamicItemModel> debtList = [DynamicItemModel()];

  bool isLoading = false;

  int parseRupiah(String value) {
    if (value.isEmpty) return 0;
    final cleanedValue = value.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(cleanedValue) ?? 0;
  }

  int get totalNonCashAssets {
    return nonCashAssets.fold(
      0,
      (sum, item) => sum + parseRupiah(item.amountController.text),
    );
  }

  int get totalAssetsNominal {
    return cashAssetNominal + totalNonCashAssets;
  }

  int get totalDebtsNominal {
    return debtList.fold(
      0,
      (sum, item) => sum + parseRupiah(item.amountController.text),
    );
  }

  int get estimasiHartaBersih {
    return totalAssetsNominal - totalDebtsNominal;
  }

  void setCashAsset(int value) {
    cashAssetNominal = value;
    notifyListeners();
  }

  void setWasiatNominal(int value) {
    wasiatNominal = value;
    notifyListeners();
  }

  void setWasiatNote(String note) {
    wasiatNote = note;
    notifyListeners();
  }

  String? updateWasiat(int val) {
    wasiatNominal = val;

    int maxWasiat = estimasiHartaBersih > 0 ? estimasiHartaBersih ~/ 3 : 0;

    String? notip;

    if (wasiatNominal > maxWasiat) {
      wasiatNominal = maxWasiat;

      notip =
          "Wasiat tidak boleh lebih dari 1/3 sisa harta (${formatRupiah(wasiatNominal)}).";
    }

    notifyListeners();
    return notip;
  }

  void addAssetRow() {
    nonCashAssets.add(DynamicItemModel());
    notifyListeners();
  }

  void removeAssetRow(int index) {
    nonCashAssets[index].dispose();
    nonCashAssets.removeAt(index);
    notifyListeners();
  }

  void addDebtRow() {
    debtList.add(DynamicItemModel());
    notifyListeners();
  }

  void removeDebtRow(int index) {
    debtList[index].dispose();
    debtList.removeAt(index);
    notifyListeners();
  }

  void updateCalculation() {
    notifyListeners();
  }

  Future<void> savePersonalNote(String userId) async {
    isLoading = true;
    notifyListeners();

    try {
      updateCalculation();
      Map<String, int> mappedAssets = {};
      for (var item in nonCashAssets) {
        String name = item.nameController.text.trim();
        int amount = parseRupiah(item.amountController.text);
        if (name.isNotEmpty && amount > 0) {
          mappedAssets[name] = amount;
        }
      }

      Map<String, int> mappedDebts = {};
      for (var item in debtList) {
        String name = item.nameController.text.trim();
        int amount = parseRupiah(item.amountController.text);
        if (name.isNotEmpty && amount > 0) {
          mappedDebts[name] = amount;
        }
      }

      final personalNote = PersonalNoteModel(
        userId: userId,
        totalAssetsNominal: totalAssetsNominal,
        totalDebtsNominal: totalDebtsNominal,
        totalWasiatNominal: wasiatNominal,
        cashAssetNominal: cashAssetNominal,
        nonCashAssets: mappedAssets,
        debtList: mappedDebts,
        wasiatNote: wasiatNote,
      );

      await _personalNoteService.savePersonalNote(personalNote);
    } catch (e) {
      throw Exception('Failed to save personal note: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getPersonalNote() async {
    isLoading = true;
    notifyListeners();

    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      isLoading = false;
      notifyListeners();
      throw Exception('User not logged in');
    }

    final userId = user.id;

    try {
      final personalNote = await _personalNoteService.getPersonalNote(userId);

      if (personalNote != null) {
        cashAssetNominal = personalNote.cashAssetNominal!;
        cashAssetController.text = formatRupiah(
          cashAssetNominal,
        ).replaceAll('Rp ', '');
        wasiatNominal = personalNote.totalWasiatNominal!;
        wasiatController.text = formatRupiah(
          wasiatNominal,
        ).replaceAll('Rp ', '');
        wasiatNote = personalNote.wasiatNote ?? '';
        wasiatNoteController.text = wasiatNote;

        nonCashAssets.clear();
        personalNote.nonCashAssets?.forEach((name, amount) {
          final item = DynamicItemModel();
          item.nameController.text = name;
          item.amountController.text = amount.toString();
          nonCashAssets.add(item);
        });

        debtList.clear();
        personalNote.debtList?.forEach((name, amount) {
          final item = DynamicItemModel();
          item.nameController.text = name;
          item.amountController.text = amount.toString();
          debtList.add(item);
        });
      }
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch personal note: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }

    isLoading = false;
    notifyListeners();
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
    for (var item in nonCashAssets) {
      item.dispose();
    }
    for (var item in debtList) {
      item.dispose();
    }

    super.dispose();
  }
}
