// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:pregmed_project/Components/ImportantNote.dart';

class GuidesScreen extends StatefulWidget {
  const GuidesScreen({super.key});

  @override
  State<GuidesScreen> createState() => _GuidesScreenState();
}

class _GuidesScreenState extends State<GuidesScreen> {
  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Define the width and height for the containers relative to screen size
    final containerWidth = screenWidth * 0.9; // 90% of screen width
    final containerHeight = 50.0; // Fixed height for containers
    final gapHeight = 30.0; // Fixed height for the gap between containers

    return Scaffold(
      backgroundColor: const Color(0xFF8FAADC), // Updated background color
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
        title: const Text(
          'Guides', // Updated title
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
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
          const SizedBox(height: 20), // Space from the top
          Container(
            width: containerWidth, // Width adjusted for responsiveness
            height: containerHeight, // Fixed height
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Horizontal margin relative to screen width
            decoration: BoxDecoration(
              color: const Color(0xFFDAE3F3), // Background color for the container
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            child: const Center(
              child: Text(
                'First Label Text', // Text for the first container
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: gapHeight), // Fixed gap between containers
          Container(
            width: containerWidth, // Width adjusted for responsiveness
            height: containerHeight, // Fixed height
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Horizontal margin relative to screen width
            decoration: BoxDecoration(
              color: const Color(0xFFDAE3F3), // Background color for the container
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            child: const Center(
              child: Text(
                'Second Label Text', // Text for the second container
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Spacer(), 
          const Divider(
            color: Colors.black,
            thickness: 1.5,
          ),
          const ImportantNote(), 
        ],
      ),
    );
  }
}
