class NoteItemModel {
  final String name;
  final int amount;
  final String description;

  NoteItemModel({
    required this.name,
    required this.amount,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'amount': amount, 'description': description};
  }

  factory NoteItemModel.fromJson(Map<String, dynamic> json) {
    return NoteItemModel(
      name: json['name'] ?? '',
      amount: json['amount'] ?? 0,
      description: json['description'] ?? '',
    );
  }
}
