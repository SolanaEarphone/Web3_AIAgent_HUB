import 'package:flutter/material.dart';

import '../utils/auth_service.dart';
import '../utils/form_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _authService.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate() && _acceptTerms) {
      setState(() => _isLoading = true);

      try {
        final success = await _authService.signUp(_nameController.text, _emailController.text, _passwordController.text);

        if (mounted) {
          if (success) {
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sign up failed')));
          }
        }
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    } else if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please accept the terms and conditions')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Join Solana Earphone', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Full Name', border: OutlineInputBorder(), prefixIcon: Icon(Icons.person)),
                  validator: FormValidator.validateName,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder(), prefixIcon: Icon(Icons.email)),
                  keyboardType: TextInputType.emailAddress,
                  validator: FormValidator.validateEmail,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder(), prefixIcon: Icon(Icons.lock)),
                  obscureText: true,
                  validator: FormValidator.validatePassword,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(labelText: 'Confirm Password', border: OutlineInputBorder(), prefixIcon: Icon(Icons.lock_outline)),
                  obscureText: true,
                  validator: (value) => FormValidator.validateConfirmPassword(value, _passwordController.text),
                ),
                const SizedBox(height: 24),
                CheckboxListTile(
                  value: _acceptTerms,
                  onChanged: (value) {
                    setState(() {
                      _acceptTerms = value ?? false;
                    });
                  },
                  title: const Text('I accept the terms and conditions'),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleSignUp,
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
                  child: _isLoading ? const CircularProgressIndicator() : const Text('Create Account'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signin');
                  },
                  child: const Text('Already have an account? Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
