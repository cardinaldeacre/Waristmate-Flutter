import 'package:flutter/material.dart';
import 'package:waristmate_app/models/learning_module.dart';
import 'package:waristmate_app/services/modul/materi_service.dart';

class MateriController extends ChangeNotifier {
  final MateriService _service = MateriService();

  List<LearningModule> _modules = [];
  List<LearningModule> _searchResults = [];

  bool _isLoading = false;

  String _searchQuery = '';

  List<LearningModule> get modules => _modules;

  List<LearningModule> get searchResults => _searchResults;

  bool get isLoading => _isLoading;

  String get searchQuery => _searchQuery;

  String? getSnippet(LearningModule module) {
    if (_searchQuery.isEmpty) {
      return null;
    }

    final text = module.searchText;
    final keyword = _searchQuery.toLowerCase();

    final index = text.indexOf(keyword);

    if (index == -1) {
      return null;
    }

    const radius = 45;

    final start = (index - radius).clamp(0, text.length);
    final end = (index + keyword.length + radius).clamp(0, text.length);

    var snippet = text.substring(start, end).trim();

    if (start > 0) {
      snippet = '...$snippet';
    }
    if (end < text.length) {
      snippet = '$snippet...';
    }

    return snippet;
  }

  Future<void> fetchLearningModules() async {
    _isLoading = true;
    notifyListeners();

    _modules = await _service.fetchLearningModules();
    _searchResults = _modules;

    _isLoading = false;
    notifyListeners();
  }

  void searchModules(String keyword) {
    _searchQuery = keyword.trim();

    if (_searchQuery.isEmpty) {
      _searchResults = _modules;
    } else {
      final query = _searchQuery.toLowerCase();

      _searchResults = _modules.where((module) {
        return module.searchText.contains(query);
      }).toList();
    }

    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    _searchResults = _modules;
    notifyListeners();
  }
}
