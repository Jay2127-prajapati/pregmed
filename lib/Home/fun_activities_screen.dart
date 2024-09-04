import 'package:flutter/material.dart';
import 'package:pregmed_project/Components/ImportantNote.dart';

class FunActivitiesScreen extends StatefulWidget {
  const FunActivitiesScreen({super.key});

  @override
  State<FunActivitiesScreen> createState() => _FunActivitiesScreenState();
}

class _FunActivitiesScreenState extends State<FunActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: const Color(0xFFA2C9CE), // Background color for the whole screen
      body: Column(
        children: [
          // AppBar
          Container(
            color: Colors.transparent, // Ensure the AppBar background is transparent
            child: AppBar(
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
                  'Fun Activities',
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
          ),
          // Divider to separate AppBar from the body
          Divider(
            color: Colors.black,
            thickness: 1.5, // Width of the divider
          ),
          // Main content
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.05), // Responsive padding
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isLandscape ? 3 : 2, // Adjust column count based on orientation
                  crossAxisSpacing: size.width * 0.04, // Responsive horizontal spacing
                  mainAxisSpacing: size.height * 0.02, // Responsive vertical spacing
                  childAspectRatio: isLandscape ? 2.5 : 1.5, // Adjust aspect ratio based on orientation
                ),
                itemCount: 8, // Number of items (buttons) in the grid
                itemBuilder: (context, index) {
                  // Button texts for each grid item
                  final buttonTexts = [
                    'Puzzle*',
                    'Poem Framing',
                    'Decorate',
                    'Manicure beauty salon*',
                    'quiz',
                    'Write a pregnancy journal',
                    'Baby names',
                    'others ',
                  ];
                  
                  return _buildButton(buttonTexts[index]);
                },
              ),
            ),
          ),
          // Divider above the NextPage widget
          Divider(
            color: Colors.black,
            thickness: 1.5, // Width of the divider
          ),
          // ImportantNote widget
          SizedBox(
            width: size.width * 0.9, // Responsive width
            child: const ImportantNote(),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFB3D2D7), // Button background color
        foregroundColor: Colors.black, // Text color
        minimumSize: Size(double.infinity, 80), // Increased button height
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
        ),
      ),
      onPressed: () {
        // Handle button press
      },
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black, // Text color
          fontWeight: FontWeight.w900, // Very bold text
          fontSize: 18, // Increased font size
        ),
      ),
    );
  }
}
