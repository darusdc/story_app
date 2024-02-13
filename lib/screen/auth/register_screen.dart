import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen(
      {super.key, required this.onLogin, required this.onRegister});
  final Function() onRegister;
  final Function() onLogin;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text('Registerr');
  }
}
