class CalculationHistoryModel {
  final int? id;
  final String userId;
  final int hartaKotor;
  final int? pengurusan;
  final int? hutang;
  final int? wasiat;
  final int hartaBersih;
  final List<Map<String, dynamic>> results;
  final DateTime? createdAt;

  CalculationHistoryModel({
    this.id,
    required this.userId,
    required this.hartaKotor,
    required this.hartaBersih,
    required this.results,
    this.pengurusan,
    this.hutang,
    this.wasiat,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'harta_kotor': hartaKotor,
      'pengurusan': pengurusan,
      'hutang': hutang,
      'wasiat': wasiat,
      'harta_bersih': hartaBersih,
      'results': results,
    };
  }

  factory CalculationHistoryModel.fromJson(Map<String, dynamic> json) {
    return CalculationHistoryModel(
      id: json['id'] as int?,
      userId: json['userId'] as String,
      hartaKotor: (json['harta_kotor'] as num).toInt(),
      pengurusan: (json['pengurusan'] as num?)?.toInt(),
      hutang: (json['hutang'] as num?)?.toInt(),
      wasiat: (json['wasiat'] as num?)?.toInt(),
      hartaBersih: (json['harta_bersih'] as num).toInt(),
      results: List<Map<String, dynamic>>.from(json['results']),
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
    );
  }
}
