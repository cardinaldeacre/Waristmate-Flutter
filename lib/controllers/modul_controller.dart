import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ModulController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  final Box progressBox = Hive.box('progressBox');

  int lastReadBab = 1;
  List<int> bookmarkedBabs = [];

  bool get isLoggedIn => _supabase.auth.currentUser != null;

  ModulController() {
    loadProgressFromHive();
  }

  void loadProgressFromHive() {
    lastReadBab = progressBox.get('last_read_bab') ?? 1;
    bookmarkedBabs = List<int>.from(progressBox.get('bookmarked_babs') ?? []);
    notifyListeners();
  }

  Future<void> fetchLastReadAndBookmarks() async {
    loadProgressFromHive();
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

      progressBox.put('last_read_bab', lastReadBab);
      progressBox.put('bookmarked_babs', bookmarkedBabs);
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

      progressBox.put('bookmarked_babs', bookmarkedBabs);
      notifyListeners();
      syncSupabaseData();
    } catch (e) {
      print('Error toggling bookmark: $e');
    }
  }

  Future<void> updateLastReadBab(int babNumber) async {
    try {
      lastReadBab = babNumber;
      progressBox.put('last_read_bab', lastReadBab);
      notifyListeners();
      syncSupabaseData();
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
