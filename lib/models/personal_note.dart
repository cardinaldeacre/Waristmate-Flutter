import 'package:waristmate_app/models/note_item.dart';

class PersonalNoteModel {
  final String userId;
  final int? totalAssetsNominal;
  final int? totalDebtsNominal;
  final int? totalWasiatNominal;
  final List<NoteItemModel> assetList;
  final List<NoteItemModel> debtList;
  final List<NoteItemModel> wasiatList;
  final String? warisanNote;

  PersonalNoteModel({
    required this.userId,
    this.totalAssetsNominal,
    this.totalDebtsNominal,
    this.totalWasiatNominal,
    this.assetList = const [],
    this.debtList = const [],
    this.wasiatList = const [],
    this.warisanNote,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'total_assets_nominal': totalAssetsNominal,
      'total_debts_nominal': totalDebtsNominal,
      'total_wasiat_nominal': totalWasiatNominal,
      'asset_list': assetList,
      'debt_list': debtList,
      'wasiat_list': wasiatList,
      'warisan_note': warisanNote,
    };
  }

  factory PersonalNoteModel.fromJson(Map<String, dynamic> json) {
    return PersonalNoteModel(
      userId: json['user_id'],
      totalAssetsNominal: (json['total_assets_nominal'] as num?)?.toInt(),
      totalDebtsNominal: (json['total_debts_nominal'] as num?)?.toInt(),
      totalWasiatNominal: (json['total_wasiat_nominal'] as num?)?.toInt(),

      assetList: json['asset_list'] != null
          ? (json['asset_list'] as List)
                .map((e) => NoteItemModel.fromJson(e))
                .toList()
          : [],
      debtList: json['debt_list'] != null
          ? (json['debt_list'] as List)
                .map((e) => NoteItemModel.fromJson(e))
                .toList()
          : [],
      wasiatList: json['wasiat_list'] != null
          ? (json['wasiat_list'] as List)
                .map((e) => NoteItemModel.fromJson(e))
                .toList()
          : [],

      warisanNote: json['warisan_note'],
    );
  }
}
