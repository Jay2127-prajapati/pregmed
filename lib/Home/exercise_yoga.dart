// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:pregmed_project/Components/ImportantNote.dart';

class ExerciseYoga extends StatefulWidget {
  const ExerciseYoga({super.key});

  @override
  State<ExerciseYoga> createState() => _ExerciseYogaState();
}

class _ExerciseYogaState extends State<ExerciseYoga> {
  String? selectedMonth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine the screen width and height
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        // Adjust padding and sizes based on screen size
        double paddingValue = screenWidth * 0.04;
        double dropdownHeight = screenHeight * 0.08;
        double dropdownFontSize = screenWidth * 0.045;

        return Scaffold(
          backgroundColor: const Color(0xFFD0A1ED), // Background color for the entire application
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back to the previous screen
              },
            ),
            title: Text(
              'Exercise & Yoga',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05, // Responsive font size
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: paddingValue),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: screenWidth * 0.06,
                  child: Image.asset('assets/img/pregmed_logo.png'), // Replace with your app logo path
                ),
              ),
            ],
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(2.0),
              child: Divider(
                color: Colors.black,
                thickness: 1.5,
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: DropdownButtonFormField<String>(
                  value: selectedMonth,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF1D3F1), // Background color of the dropdown
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: dropdownFontSize, // Responsive font size inside the dropdown
                  ),
                  dropdownColor: const Color(0xFFFFFFFF), // Background color of the dropdown items
                  hint: Text(
                    "Select your Month of Pregnancy",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: dropdownFontSize, // Responsive font size for the hint
                    ),
                  ),
                  items: List.generate(9, (index) {
                    return DropdownMenuItem<String>(
                      value: (index + 1).toString(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
                        children: [
                          Text("Month ${index + 1}"),
                          if (index < 8) // Add a divider after each item except the last one
                            const Divider(
                              color: Colors.black,
                              thickness: 1.0,
                            ),
                        ],
                      ),
                    );
                  }),
                  onChanged: (value) {
                    setState(() {
                      selectedMonth = value;
                    });
                  },
                ),
              ),
              const Spacer(), // Pushes the dropdown to the top of the available space
              const Divider(
                color: Colors.black,
                thickness: 1.5,
              ),
              const ImportantNote(), // Reusable component called at the bottom of the application
            ],
          ),
        );
      },
    );
  }
}
