import 'package:flutter/material.dart';
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
                style: const TextStyle(color: Colors.black, fontSize: 18),
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
          padding: const EdgeInsets.all(1.0),
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
            color: const Color(0xFFc5e0b4),
          ),
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/img/ladies_bg.png', // Replace with your background image asset
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding for left and right sides
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildButton('Button 1', () => navigateToScreen(MedicinesScreen())),
                  const SizedBox(height: 16), // Space between buttons
                  _buildButton('Button 2', () => navigateToScreen(MedicinesScreen())),
                  const SizedBox(height: 16), // Space between buttons
                  _buildButton('Button 3', () => navigateToScreen(MedicinesScreen())),
                  const SizedBox(height: 16), // Space between buttons
                  _buildButton('Button 4', () => navigateToScreen(MedicinesScreen())),
                  const SizedBox(height: 16), // Space between buttons
                  _buildButton('Button 5', () => navigateToScreen(MedicinesScreen())),
                  const SizedBox(height: 16), // Space between buttons
                  _buildButton('Button 6', () => navigateToScreen(MedicinesScreen())),
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
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFe2f0d9), // Button background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          minimumSize: Size(double.infinity, 48), // Full width button
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
