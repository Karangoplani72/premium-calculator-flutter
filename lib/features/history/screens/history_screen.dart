import 'package:flutter/material.dart';

import '../models/history_item.dart';

class HistoryScreen extends StatelessWidget {
  final List<HistoryItem> history;
  final VoidCallback onClear;

  const HistoryScreen({
    super.key,
    required this.history,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),

        actions: [
          IconButton(onPressed: onClear, icon: const Icon(Icons.delete)),
        ],
      ),

      body: history.isEmpty
          ? const Center(child: Text("No History"))
          : ListView.builder(
              itemCount: history.length,

              itemBuilder: (context, index) {
                final item = history[index];

                return ListTile(
                  title: Text(item.expression),
                  subtitle: Text(item.result),
                );
              },
            ),
    );
  }
}
