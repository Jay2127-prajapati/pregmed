import 'package:flutter/material.dart';
import 'package:pregmed_project/Components/ImportantNote.dart';

class LiteraturesArticalsScreen extends StatefulWidget {
  const LiteraturesArticalsScreen({super.key});

  @override
  State<LiteraturesArticalsScreen> createState() => _LiteraturesArticalsScreenState();
}

class _LiteraturesArticalsScreenState extends State<LiteraturesArticalsScreen> {
  String _selectedReligion = 'Select Religion'; // Default value for the dropdown

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffe699), // Background color for the AppBar
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: const Center(
          child: Text(
            'Literatures & Articles',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02), // Responsive padding
            child: const CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/img/pregmed_logo.png'), // Replace with your logo asset
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.black, // Divider color
            height: 1.5, // Divider thickness
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFffe699), // Background color for the body
        padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
        child: Column(
          children: [
            // Dropdown menu
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.02), // Responsive padding
              child: DropdownButton<String>(
                value: _selectedReligion,
                items: [
                  const DropdownMenuItem(
                    value: 'Select Religion',
                    child: Text('Select Religion'),
                  ),
                  const DropdownMenuItem(
                    value: 'Religion 1',
                    child: Text('Religion 1'),
                  ),
                  const DropdownMenuItem(
                    value: 'Religion 2',
                    child: Text('Religion 2'),
                  ),
                  const DropdownMenuItem(
                    value: 'Religion 3',
                    child: Text('Religion 3'),
                  ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedReligion = newValue ?? 'Select Religion';
                  });
                },
                isExpanded: true, // Make the dropdown expand to fit the width
                dropdownColor: const Color(0xFFf2c400), // Dark yellow dropdown color
              ),
            ),
            // Placeholder for additional content
            Expanded(
              child: Center(
                child: Text(
                  'Content goes here',
                  style: TextStyle(
                    fontSize: screenWidth * 0.05, // Responsive font size
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // Bottom Divider
            Divider(
              color: Colors.black,
              thickness: 1.5,
              height: screenHeight * 0.02, // Responsive height
            ),
            const ImportantNote(), // Use the reusable ImportantNote widget
          ],
        ),
      ),
    );
  }
}
