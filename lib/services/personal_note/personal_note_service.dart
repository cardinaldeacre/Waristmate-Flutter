import 'dart:convert';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:waristmate_app/models/personal_note.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class PersonalNoteService {
  final SupabaseClient _supabase = Supabase.instance.client;

  final _personalNoteBox = Hive.box('personalNoteBox');

  final _key = encrypt.Key.fromUtf8('WarisMateSuperSecretKey2026Pasti');
  final _iv = encrypt.IV.fromLength(16);

  String encryptText(String plainText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(_key));
    final encrypted = encrypter.encrypt(plainText, iv: _iv);
    return encrypted.base64;
  }

  String decryptText(String encryptedText) {
    try {
      final encrypter = encrypt.Encrypter(encrypt.AES(_key));
      return encrypter.decrypt64(encryptedText, iv: _iv);
    } catch (e) {
      return encryptedText;
    }
  }

  dynamic encryptList(List<dynamic>? list) {
    if (list == null || list.isEmpty) {
      return [];
    }

    final jsonString = jsonEncode(list);
    final encryptedString = encryptText(jsonString);
    return {'encrypted_payload': encryptedString};
  }

  List<dynamic>? decryptList(dynamic encryptedData) {
    if (encryptedData == null) {
      return [];
    }

    if (encryptedData is Map &&
        encryptedData.containsKey('encrypted_payload')) {
      try {
        final decryptedString = decryptText(
          encryptedData['encrypted_payload'] as String,
        );
        return jsonDecode(decryptedString) as List<dynamic>;
      } catch (e) {
        return [];
      }
    }

    if (encryptedData is List) {
      return encryptedData;
    }

    return [];
  }

  Future<PersonalNoteModel?> getPersonalNote(String userId) async {
    try {
      final response = await _supabase
          .from('personal_records')
          .select()
          .eq('user_id', userId)
          .maybeSingle();

      if (response != null) {
        final Map<String, dynamic> responseData = Map.from(response);

        if (responseData['warisan_note'] != null) {
          responseData['warisan_note'] = decryptText(
            responseData['warisan_note'],
          );
        }

        responseData['asset_list'] = decryptList(responseData['asset_list']);
        responseData['debt_list'] = decryptList(responseData['debt_list']);
        responseData['wasiat_list'] = decryptList(responseData['wasiat_list']);

        final personalNote = PersonalNoteModel.fromJson(responseData);
        await _personalNoteBox.put(userId, personalNote.toJson());
        return personalNote;
      }
      return null;
    } catch (e) {
      final localData = _personalNoteBox.get(userId);
      if (localData != null) {
        return PersonalNoteModel.fromJson(Map<String, dynamic>.from(localData));
      }

      throw Exception('Failed to fetch personal note: $e');
    }
  }

  Future<void> savePersonalNote(PersonalNoteModel note) async {
    try {
      final dataToSupabase = note.toJson();

      if (dataToSupabase['warisan_note'] != null &&
          dataToSupabase['warisan_note'].toString().isNotEmpty) {
        dataToSupabase['warisan_note'] = encryptText(
          dataToSupabase['warisan_note'],
        );
      }

      dataToSupabase['asset_list'] = encryptList(dataToSupabase['asset_list']);
      dataToSupabase['debt_list'] = encryptList(dataToSupabase['debt_list']);
      dataToSupabase['wasiat_list'] = encryptList(
        dataToSupabase['wasiat_list'],
      );

      final response = await _supabase
          .from('personal_records')
          .upsert(dataToSupabase, onConflict: 'user_id');

      if (response != null || true) {
        await _personalNoteBox.put(note.userId, note.toJson());
      }
    } catch (e) {
      throw Exception('Failed to save personal note: $e');
    }
  }

  Future<void> clearLocalData() async {
    await _personalNoteBox.clear();
  }
}
