import 'package:hive_flutter/hive_flutter.dart';

class SearchHistoryService {
  static const String _boxName = 'search_history';
  static const int _maxHistoryCount = 4;

  // Open the box (call this in main() or initState)
  Future<void> init() async {
    await Hive.openBox<String>(_boxName);
  }

  // Save a search term
  Future<void> addSearchTerm(String term) async {
    final box = Hive.box<String>(_boxName);
    final cleanTerm = term.trim();

    if (cleanTerm.isEmpty) return;

    // 1. Get current list
    List<String> history = box.values.toList();

    // 2. Remove if it already exists (to re-insert at the top)
    history.remove(cleanTerm);

    // 3. Add to the start (Index 0)
    history.insert(0, cleanTerm);

    // 4. Limit the size (keep only the first 10)
    if (history.length > _maxHistoryCount) {
      history = history.sublist(0, _maxHistoryCount);
    }

    // 5. Clear the box and re-save the new ordered list
    // (In Hive, it's often easier to 'put' the whole list if using keys)
    await box.clear();
    await box.addAll(history);
  }

  List<String> getHistory() {
    return Hive.box<String>(_boxName).values.toList();
  }

  Future<void> deleteTerm(String term) async {
    final box = Hive.box<String>(_boxName);
    final List<String> history = box.values.toList();
    history.remove(term);
    await box.clear();
    await box.addAll(history);
  }

  Future<void> clearAllHistory() async {
    final box = Hive.box<String>(_boxName);
    await box.clear();
  }
}
