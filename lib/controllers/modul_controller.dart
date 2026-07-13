import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ModulController extends ChangeNotifier {
  final _supabase = Supabase.instance.client;
  final Box progressBox = Hive.box('progressBox');

  int lastReadBab = 1;
  List<int> bookmarkedBabs = [];

  bool get isLoggedIn => _supabase.auth.currentUser != null;

  static const _lastReadKey = 'last_read_bab';
  static const _bookmarkedKey = 'bookmarked_babs';
  static const _dirtyKey = 'progress_dirty';

  ModulController() {
    loadProgressFromHive();
  }

  void loadProgressFromHive() {
    lastReadBab = progressBox.get(_lastReadKey, defaultValue: 1);
    bookmarkedBabs = List<int>.from(
      progressBox.get(_bookmarkedKey, defaultValue: <int>[]),
    );
    notifyListeners();
  }

  Future<void> fetchLastReadAndBookmarks() async {
    loadProgressFromHive();
    try {
      if (!isLoggedIn) return;

      final dirty = progressBox.get(_dirtyKey, defaultValue: false);
      if (dirty) {
        await uploadProgress();
      }

      await getProgress();
    } catch (e) {
      debugPrint('Error fetching last read and bookmarks: $e');
    }
  }

  Future<void> toggleBookmark(int babNumber) async {
    try {
      if (bookmarkedBabs.contains(babNumber)) {
        bookmarkedBabs.remove(babNumber);
      } else {
        bookmarkedBabs.add(babNumber);
      }

      await progressBox.put(_bookmarkedKey, bookmarkedBabs);
      await progressBox.put(_dirtyKey, true);

      notifyListeners();
      uploadProgress();
    } catch (e) {
      debugPrint('Error toggling bookmark: $e');
    }
  }

  Future<void> updateLastReadBab(int babNumber) async {
    try {
      lastReadBab = babNumber;
      progressBox.put(_lastReadKey, lastReadBab);
      progressBox.put(_dirtyKey, true);

      notifyListeners();
      uploadProgress();
    } catch (e) {
      debugPrint('Error updating last read bab: $e');
    }
  }

  Future<void> uploadProgress() async {
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

      await progressBox.put(_dirtyKey, false);

      debugPrint("Sukses update progress ke Supabase!");
    } catch (e) {
      debugPrint("Error update progress: $e");
    }
  }

  Future<void> getProgress() async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) return;

    try {
      final response = await _supabase
          .from('profiles')
          .select('read_progress')
          .eq('id', userId)
          .single();

      final progressData =
          response['read_progress'] as Map<String, dynamic>? ?? {};

      lastReadBab = progressData['last_read_bab'] ?? 1;
      bookmarkedBabs = List<int>.from(progressData['bookmarked_babs'] ?? []);

      await progressBox.put(_lastReadKey, lastReadBab);
      await progressBox.put(_bookmarkedKey, bookmarkedBabs);

      notifyListeners();

      debugPrint("Sukses mengambil progress dari Supabase!");
    } catch (e) {
      debugPrint('Error fetching progress: $e');
    }
  }
}
