import 'package:dstory_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.onLogOut});
  final Function() onLogOut;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = context.watch<AuthProvider>();
    return Scaffold(
      body: Center(
        child: auth.isLoadingLogout
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  await auth.logout();
                  onLogOut();
                },
                child: const Text('Logout')),
      ),
    );
  }
}
