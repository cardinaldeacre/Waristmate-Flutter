import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteController extends ChangeNotifier {
  int noteTirkah = 0;
  int noteHutang = 0;
  int noteWasiat = 0;
  int noteTajhiz = 0;
  int noteIrst = 0;
  int notetotalWarisan = 0;

  void setHarta(int value) {
    noteTirkah = value;
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
}
