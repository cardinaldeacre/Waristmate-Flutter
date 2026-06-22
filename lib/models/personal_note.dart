class PersonalNoteModel {
  final String userId;
  final int? totalAssetsNominal;
  final int? totalDebtsNominal;
  final int? totalWasiatNominal;
  final int? cashAssetNominal;
  final Map<String, int>? nonCashAssets;
  final Map<String, int>? debtList;
  final String? wasiatNote;

  PersonalNoteModel({
    required this.userId,
    this.totalAssetsNominal,
    this.totalDebtsNominal,
    this.totalWasiatNominal,
    this.cashAssetNominal,
    this.nonCashAssets = const {},
    this.debtList = const {},
    this.wasiatNote,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'total_assets_nominal': totalAssetsNominal,
      'total_debts_nominal': totalDebtsNominal,
      'total_wasiat_nominal': totalWasiatNominal,
      'cash_asset_nominal': cashAssetNominal,
      'non_cash_assets': nonCashAssets,
      'debt_list': debtList,
      'wasiat_note': wasiatNote,
    };
  }

  factory PersonalNoteModel.fromJson(Map<String, dynamic> json) {
    return PersonalNoteModel(
      userId: json['user_id'],
      totalAssetsNominal: json['total_assets_nominal'],
      totalDebtsNominal: json['total_debts_nominal'],
      totalWasiatNominal: json['total_wasiat_nominal'],
      cashAssetNominal: json['cash_asset_nominal'],
      nonCashAssets: json['non_cash_assets'] != null
          ? Map<String, int>.from(json['non_cash_assets'])
          : null,
      debtList: json['debt_list'] != null
          ? Map<String, int>.from(json['debt_list'])
          : null,
      wasiatNote: json['wasiat_note'],
    );
  }
}
