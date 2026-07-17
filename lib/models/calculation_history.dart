class CalculationHistoryModel {
  final String userId;
  final int hartaKotor;
  final int? pengurusan;
  final int? hutang;
  final int? wasiat;
  final int hartaBersih;
  final List<Map<String, dynamic>> results;
  final List<Map<String, dynamic>> penghalang;
  final String? createdAt;

  CalculationHistoryModel({
    required this.userId,
    required this.hartaKotor,
    required this.hartaBersih,
    required this.results,
    required this.penghalang,
    this.pengurusan,
    this.hutang,
    this.wasiat,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'harta_kotor': hartaKotor,
      'pengurusan': pengurusan,
      'hutang': hutang,
      'wasiat': wasiat,
      'harta_bersih': hartaBersih,
      'results': results,
      'penghalang': penghalang,
      'created_at': createdAt,
    };
  }

  factory CalculationHistoryModel.fromJson(Map<String, dynamic> json) {
    return CalculationHistoryModel(
      userId: json['user_id'] as String,
      hartaKotor: (json['harta_kotor'] as num).toInt(),
      pengurusan: (json['pengurusan'] as num?)?.toInt(),
      hutang: (json['hutang'] as num?)?.toInt(),
      wasiat: (json['wasiat'] as num?)?.toInt(),
      hartaBersih: (json['harta_bersih'] as num).toInt(),
      results: List<Map<String, dynamic>>.from(json['results'] ?? []),
      penghalang: List<Map<String, dynamic>>.from(json['penghalang'] ?? []),
      createdAt: json['created_at'] as String?,
    );
  }
}
