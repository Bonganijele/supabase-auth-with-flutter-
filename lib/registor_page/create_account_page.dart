import 'package:cooklink/auth/auth_service.dart';
import 'package:cooklink/components/custom_textfield_registor.dart';
import 'package:cooklink/components/btn.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final authService = AuthService();

  
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  void createAccount() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _passwordConfirmController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Passwords don't match")));
      return;
    }

    try {
      await authService.signUpWithEmailPassword(email, password);
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
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
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

           
            CustomTextField(controller: _emailController, label: 'Email'),
            CustomTextField(controller: _passwordController, label: 'Password', isPassword: true),
            CustomTextField(controller: _passwordConfirmController, label: 'Confirm Password', isPassword: true),

            const SizedBox(height: 20),
            CustomElevatedButton(
              onPressed: createAccount,
              label: 'Create Account',
              backgroundColor: Colors.blueAccent,
              textColor: Colors.black,
              height: 50.0,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
