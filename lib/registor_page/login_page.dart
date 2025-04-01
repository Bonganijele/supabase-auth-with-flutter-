import 'package:cooklink/auth/auth_service.dart';
import 'package:cooklink/components/btn.dart';
import 'package:cooklink/components/custom_textfield_registor.dart';
import 'package:cooklink/registor_page/create_account_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // get auth service
  final authService = AuthService();

  // text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    // prepare data
    final email = _emailController.text;
    final password = _passwordController.text;
    // attempt login..
    try {
      await authService.signInWithEmailPassword(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.transparent, // Adjust color as needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Cooklink',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Adjust text color as needed
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(controller: _emailController, label: 'Email'),

            const SizedBox(height: 10),
            CustomTextField(
              controller: _passwordController,
              isPassword: true,
              label: "Password",
            ),

            const SizedBox(height: 20),
            CustomElevatedButton(
              onPressed: login,
              label: 'Log In',
              backgroundColor: Colors.blueAccent,
              textColor: Colors.black,
              height: 50.0, // You can adjust this if needed
              width: double.infinity, // Set width to fill the screen
            ),
            const SizedBox(height: 10),

            GestureDetector(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAccountPage(),
                    ),
                  ),
              child: Center(
                child: Text(
                  'Don\'t have an account? Sign Up',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
