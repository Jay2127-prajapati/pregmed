import 'package:flutter/material.dart';
import 'package:pregmed_project/Components/dropdownWidget.dart';
import 'package:pregmed_project/components/image_picker_widget.dart';
import 'package:pregmed_project/components/text_field_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();

  bool _isNameValid = true;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isPhoneValid = true;

  String? _selectedState;
  String? _selectedLanguage;

  final List<String> _states = ['State 1', 'State 2', 'State 3'];
  final List<String> _languages = ['Language 1', 'Language 2', 'Language 3'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = EdgeInsets.symmetric(horizontal: screenWidth * 0.05);

    return Scaffold(
      resizeToAvoidBottomInset: true, // Allow resizing when the keyboard appears
      backgroundColor: const Color(0xFFcfecf5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomInset),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/img/pregmed_logo.png'),
                      radius: 30,
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const ImagePickerWidget(),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    "Upload your img",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldWidget(
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        label: "Name",
                        isValid: _isNameValid,
                        onChanged: (value) {
                          setState(() {
                            _isNameValid = value.isNotEmpty;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        label: "Email",
                        isValid: _isEmailValid,
                        onChanged: (value) {
                          setState(() {
                            _isEmailValid = value.contains('@');
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        label: "Password",
                        isValid: _isPasswordValid,
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            _isPasswordValid = value.isNotEmpty;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        controller: _phoneController,
                        focusNode: _phoneFocusNode,
                        label: "Phone",
                        isValid: _isPhoneValid,
                        onChanged: (value) {
                          setState(() {
                            _isPhoneValid = value.isNotEmpty;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownWidget(
                        value: _selectedState,
                        items: _states,
                        hint: "Select State/Region",
                        onChanged: (value) {
                          setState(() {
                            _selectedState = value;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownWidget(
                        value: _selectedLanguage,
                        items: _languages,
                        hint: "Select Preferred Language",
                        onChanged: (value) {
                          setState(() {
                            _selectedLanguage = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.blueAccent,
                          ),
                          onPressed: () {
                            // Implement signup logic
                          },
                          child: const Text(
                            "Signup",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: screenWidth * 0.05),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already registered?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Go back to login screen
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
