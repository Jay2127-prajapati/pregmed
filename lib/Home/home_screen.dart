// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:pregmed_project/Components/ImportantNote.dart';
import 'package:pregmed_project/Home/literatures_articals_screen.dart';
import 'package:pregmed_project/Home/medicines_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  void navigateToScreen(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFc5e0b4),
        elevation: 0,
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getGreeting(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.05, // Responsive font size
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'User Name',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0), // Adjusted padding for better responsiveness
          child: Image.asset('assets/img/pregmed_logo.png'), // Replace with your logo asset
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img/pregmed_logo.png'),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.black, // Divider line color
            height: 1,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background color
          Container(
            color: const Color(0xFFc5e0b4), // Background color
          ),
          // Background Image with controlled width
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: screenWidth * 0.9, // Adjust the width as needed
              child: Image.asset(
                'assets/img/ladies_bg.png', // Replace with your background image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // Responsive padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildButton('Index of Medicines', () => navigateToScreen(MedicinesScreen())),
                  const SizedBox(height: 16), // Space between buttons
                  _buildButton('Literatures & Articles', () => navigateToScreen(LiteraturesArticalsScreen())),
                  const SizedBox(height: 16), // Space between buttons
                  _buildButton('Exercise & Yoga', () => navigateToScreen(MedicinesScreen())),
                  const SizedBox(height: 16), // Space between buttons
                  _buildButton('Diet & Nutrition', () => navigateToScreen(MedicinesScreen())),
                  const SizedBox(height: 16), // Space between buttons
                  _buildButton('Fun activities', () => navigateToScreen(MedicinesScreen())),
                  const SizedBox(height: 16), // Space between buttons
                  _buildButton('Guides', () => navigateToScreen(MedicinesScreen())),
                  const SizedBox(height: 32), // Space before icon buttons

                  // Horizontal Icon Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildIconButton(Icons.help_outline_sharp, 'FAQ', () {
                        // Action for FAQ button
                      }),
                      _buildIconButton(Icons.chat_bubble_outline, 'Start Chat...', () {
                        // Action for Start Chat button
                      }),
                      _buildIconButton(Icons.feedback_outlined, 'Feedback', () {
                        // Action for Feedback button
                      }),
                    ],
                  ),
                  const SizedBox(height: 16), // Space before divider
                  
                  // Divider
                  const Divider(
                    color: Colors.black,
                    thickness: 1.5,
                  ),

                  const SizedBox(height: 16), // Space before warning text

                  // Warning Text Component
                  const ImportantNote(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01), // Responsive padding
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFe2f0d9), // Button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          minimumSize: Size(double.infinity, MediaQuery.of(context).size.height * 0.06), // Responsive height
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black, // Button text color set to black
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.04, // Responsive font size
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          iconSize: MediaQuery.of(context).size.width * 0.09, // Responsive icon size
          onPressed: onPressed,
          color: Colors.black,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.04, // Responsive font size
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
