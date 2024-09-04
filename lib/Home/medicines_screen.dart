import 'package:flutter/material.dart';
import 'package:pregmed_project/Components/ImportantNote.dart'; // Import your ImportantNote component

class MedicinesScreen extends StatefulWidget {
  const MedicinesScreen({super.key});

  @override
  State<MedicinesScreen> createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends State<MedicinesScreen> {
  final List<String> _allResults = [
    'Hypertension',
    'Diabetes',
    'Ulcers',
    'Body Pain',
    'Headache',
    'Asthma',
    'Allergy',
    'Arthritis',
  ]; // All possible search results
  List<String> _filteredResults = []; // List to display based on search query

  @override
  void initState() {
    super.initState();
    _filteredResults = _allResults; // Initially show all results
  }

  void _filterResults(String query) {
    setState(() {
      _filteredResults = _allResults
          .where((result) => result.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLargeScreen = screenSize.width > 600; // Define what constitutes a large screen

    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent UI from shifting when the keyboard appears
      appBar: AppBar(
        backgroundColor: const Color(0xFFf8cbad), // Background color for the AppBar
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Index of Medicine',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: isLargeScreen ? 24 : 20, // Responsive font size
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(isLargeScreen ? 16.0 : 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img/pregmed_logo.png'), // Replace with your logo asset
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Colors.black, // Divider color
            height: 1,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFf8cbad), // Background color for the body
        padding: EdgeInsets.all(isLargeScreen ? 32.0 : 16.0), // Responsive padding
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: EdgeInsets.only(bottom: isLargeScreen ? 24.0 : 16.0),
              child: TextField(
                onChanged: _filterResults, // Update results as user types
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for a condition...',
                  hintStyle: TextStyle(fontSize: isLargeScreen ? 18 : 14), // Responsive hint text size
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(isLargeScreen ? 12.0 : 8.0), // Responsive border radius
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            // Search Results
            Expanded(
              child: ListView(
                children: _filteredResults.map((result) => _buildResultButton(result, isLargeScreen)).toList(),
              ),
            ),
            // Divider
            const Divider(
              color: Colors.black,
              thickness: 1.5,
            ),
            SizedBox(height: isLargeScreen ? 32 : 16), // Responsive space before the ImportantNote
            const ImportantNote(),
          ],
        ),
      ),
    );
  }

  Widget _buildResultButton(String title, bool isLargeScreen) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLargeScreen ? 16.0 : 8.0), // Responsive padding
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFf4b183), // Button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isLargeScreen ? 12.0 : 8.0), // Responsive border radius
          ),
          minimumSize: Size(double.infinity, isLargeScreen ? 60 : 48), // Responsive button height
        ),
        onPressed: () {
          // Action when the button is pressed
        },
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black, // Text color
            fontSize: isLargeScreen ? 18 : 16, // Responsive text size
          ),
        ),
      ),
    );
  }
}
