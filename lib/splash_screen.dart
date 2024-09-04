import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pregmed_project/Authentication/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1D3F1), 
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              width: 300, 
              height: 300, 
              child: Image.asset(
                'assets/img/pregmed_logo.png', 
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
