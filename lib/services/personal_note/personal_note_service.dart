import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:waristmate_app/models/personal_note.dart';

class PersonalNoteService {
  final SupabaseClient _supabase = Supabase.instance.client;

  final _personalNoteBox = Hive.box('personalNoteBox');

  Future<PersonalNoteModel?> getPersonalNote(String userId) async {
    try {
      final response = await _supabase
          .from('personal_records')
          .select()
          .eq('user_id', userId)
          .maybeSingle();

      if (response != null) {
        final personalNote = PersonalNoteModel.fromJson(response);
        await _personalNoteBox.put(userId, personalNote.toJson());
        return personalNote;
      }
      return null;
    } catch (e) {
      throw Exception('Failed to fetch personal note: $e');
    }
  }

  Future<void> savePersonalNote(PersonalNoteModel note) async {
    try {
      print("Saving personal note: ${note.toJson()}");
      final response = await _supabase
          .from('personal_records')
          .upsert(note.toJson(), onConflict: 'user_id');

      if (response != null) {
        await _personalNoteBox.put(note.userId, note.toJson());
      }
    } catch (e) {
      throw Exception('Failed to save personal note: $e');
    }
  }
}
