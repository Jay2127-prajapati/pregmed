import 'package:flutter/material.dart';

class ImportantNote extends StatelessWidget {
  const ImportantNote({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        "IMPORTANT: Always consult your doctor before starting any new medication or treatment to ensure it is safe and suitable for your health condition.",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
