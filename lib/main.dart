import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dstory_app/common/styles.dart';
import 'package:dstory_app/databases/auth_repository.dart';
import 'package:dstory_app/providers/auth_provider.dart';
import 'package:dstory_app/routes/router_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late AppRouterDelegate appRouterDelegate;
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    final authRepository = AuthRepository();

    authProvider = AuthProvider(authRepository);
    appRouterDelegate = AppRouterDelegate(authRepository);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => authProvider,
      child: MaterialApp(
        title: 'dstory_appory App',
        theme: lightTheme,
        home: Router(
          routerDelegate: appRouterDelegate,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
