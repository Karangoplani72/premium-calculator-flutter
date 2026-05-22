import 'package:flutter/material.dart';

class AppDropdown<T> extends StatelessWidget {
  final T value;

  final List<T> items;

  final String Function(T) labelBuilder;

  final Function(T?) onChanged;

  const AppDropdown({
    super.key,

    required this.value,

    required this.items,

    required this.labelBuilder,

    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,

      isExpanded: true,

      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),

      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,

          child: Text(labelBuilder(item), overflow: TextOverflow.ellipsis),
        );
      }).toList(),

      onChanged: onChanged,
    );
  }
}
