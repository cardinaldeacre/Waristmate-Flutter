import 'package:hive_flutter/hive_flutter.dart';
import 'package:waristmate_app/models/personal_note.dart';

class PersonalNoteDraftService {
  static const String _boxName = 'personalDraftBox';

  Box get _box => Hive.box(_boxName);

  Future<void> saveDraft(PersonalNoteModel note) async {
    await _box.put(note.userId, note.toJson());
  }

  PersonalNoteModel? loadDraft(String userId) {
    final data = _box.get(userId);

    if (data == null) return null;

    return PersonalNoteModel.fromJson(Map<String, dynamic>.from(data));
  }

  bool hasDraft(String userId) {
    return _box.containsKey(userId);
  }

  Future<void> deleteDraft(String userId) async {
    await _box.delete(userId);
  }
}
