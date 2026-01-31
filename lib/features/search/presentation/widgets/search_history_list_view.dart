import 'package:flutter/material.dart';
import 'package:fruits_hub/features/search/presentation/widgets/search_history_item.dart';

class SearchHistoryListView extends StatelessWidget {
  final List<String> historyItems;
  final Function(String) onItemTap;
  final Function(String) onClearItem;

  const SearchHistoryListView({
    super.key,
    required this.historyItems,
    required this.onItemTap,
    required this.onClearItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: historyItems.length,
      itemBuilder: (context, index) {
        final item = historyItems[index];
        return SearchHistoryItem(
          onItemTap: onItemTap,
          item: item,
          onClearItem: (item) => onClearItem(item),
        );
      },
    );
  }
}
