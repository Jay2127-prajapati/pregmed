import 'package:flutter/material.dart';
import 'package:pregmed_project/Components/ImportantNote.dart';

class DietNutrition extends StatefulWidget {
  const DietNutrition({super.key});

  @override
  State<DietNutrition> createState() => _DietNutritionState();
}

class _DietNutritionState extends State<DietNutrition> {
  @override
  Widget build(BuildContext context) {
    // Obtain the size of the screen
    final Size screenSize = MediaQuery.of(context).size;
    final double buttonHeight = screenSize.height * 0.07; // 7% of screen height
    final double buttonWidth = screenSize.width * 0.9; // 90% of screen width

    return Scaffold(
      backgroundColor: const Color(0xFFC7F49A), // Updated background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove the default shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            'Diet & Nutrition',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20, // Adjust as needed
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: Image.asset('assets/img/pregmed_logo.png'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.black,
            thickness: 1.5, // Width of the divider
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: [
                _buildButton('Fruits', buttonWidth, buttonHeight),
                _buildButton('Vegetables', buttonWidth, buttonHeight),
                _buildButton('Millets', buttonWidth, buttonHeight),
                _buildButton('Dried fruits & Nuts', buttonWidth, buttonHeight),
                _buildButton('Dairy Products', buttonWidth, buttonHeight),
                _buildButton('Non veg items', buttonWidth, buttonHeight),
                _buildButton('Beverages', buttonWidth, buttonHeight),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1.5, // Width of the divider
          ),
          const ImportantNote(),
        ],
      ),
    );
  }

  Widget _buildButton(String text, double width, double height) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // Space between buttons
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFA9D18E), // Button background color
            foregroundColor: Colors.black, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Optional rounded corners
            ),
          ),
          onPressed: () {
            // Handle button press
          },
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16, // Adjust as needed
            ),
          ),
        ),
      ),
    );
  }
}
