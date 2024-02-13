import 'package:flutter/material.dart';
import 'package:story_app/widgets/platform_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(
      {super.key, required this.onLogin, required this.onRegister});

  final Function() onLogin;
  final Function() onRegister;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: androidBuilder,
      iosBuilder: iosBuilder,
      webBuilder: webBuilder,
    );
  }

  Widget androidBuilder(BuildContext context) {
    return const Center(child: Text("Login"),);
  }

  Widget iosBuilder(BuildContext context) {
    return const Placeholder();
  }

  Widget webBuilder(BuildContext context) {
    return const Placeholder();
  }
}
