import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String hint;
  final ValueChanged<String?> onChanged;

  const DropdownWidget({
    Key? key,
    required this.value,
    required this.items,
    required this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
        filled: true,
        fillColor: Colors.transparent,
      ),
      dropdownColor: const Color(0xFFcfecf5).withOpacity(0.9),
      onChanged: onChanged,
      hint: Text(hint),
      // Add padding to the dropdown menu by wrapping it with a Container
      itemHeight: 50, // Adjust item height if needed
    );
  }
}
