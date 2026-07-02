import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ModulController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;

  int lastReadBab = 1;
  List<int> bookmarkedBabs = [];

  Future<void> fetchLastReadAndBookmarks() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) return;

      final response = await _supabase
          .from('profiles')
          .select('read_progress')
          .eq('id', userId)
          .single();

      final progressData = response['read_progress'] as Map<String, dynamic>?;

      lastReadBab = progressData?['last_read_bab'] ?? 1;
      bookmarkedBabs = List<int>.from(progressData?['bookmarked_babs'] ?? []);
      notifyListeners();
    } catch (e) {
      print('Error fetching last read and bookmarks: $e');
    }
  }

  Future<void> toggleBookmark(int babNumber) async {
    try {
      if (bookmarkedBabs.contains(babNumber)) {
        bookmarkedBabs.remove(babNumber);
      } else {
        bookmarkedBabs.add(babNumber);
      }

      notifyListeners();
      await syncSupabaseData();
    } catch (e) {
      print('Error toggling bookmark: $e');
    }
  }

  Future<void> updateLastReadBab(int babNumber) async {
    try {
      lastReadBab = babNumber;

      notifyListeners();
      await syncSupabaseData();
    } catch (e) {
      print('Error updating last read bab: $e');
    }
  }

  Future<void> syncSupabaseData() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return;

    try {
      final progressData = {
        'last_read_bab': lastReadBab,
        'bookmarked_babs': bookmarkedBabs,
      };

      await _supabase
          .from('profiles')
          .update({'read_progress': progressData})
          .eq('id', user.id);

      print("Sukses update progress ke Supabase!");
    } catch (e) {
      print("Error update progress: $e");
    }
  }
}
