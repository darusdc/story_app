import 'package:flutter/material.dart';
import 'package:dstory_app/databases/auth_repository.dart';
import 'package:dstory_app/screen/auth/login_screen.dart';
import 'package:dstory_app/screen/auth/register_screen.dart';
import 'package:dstory_app/screen/auth/welcome_screen.dart';
import 'package:dstory_app/screen/home/home.dart';
import 'package:dstory_app/screen/splash_screen.dart';

class AppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;
  final AuthRepository authRepository;

  AppRouterDelegate(
    this.authRepository,
  ) : _navigatorKey = GlobalKey<NavigatorState>() {
    /// todo 9: create initial function to check user logged in.
    _init();
  }

  _init() async {
    isLoggedIn = await authRepository.isLoggedIn();
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  String? selectedQuote;

  /// todo 8: add historyStack variable to maintaining the stack
  List<Page> historyStack = [];
  bool? isLoggedIn;
  bool isLogin = false;
  bool isRegister = false;

  @override
  Widget build(BuildContext context) {
    /// todo 11: create conditional statement to declare historyStack based on  user logged in.
    if (isLoggedIn == null) {
      historyStack = _splashStack;
    } else if (isLoggedIn == true) {
      historyStack = _loggedInStack;
    } else {
      historyStack = _loggedOutStack;
    }
    return Navigator(
      key: navigatorKey,

      /// todo 10: change the list with historyStack
      pages: historyStack,
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        isRegister = false;
        selectedQuote = null;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    /* Do Nothing */
  }

  /// todo 12: add these variable to support history stack
  List<Page> get _splashStack => const [
        MaterialPage(
          key: ValueKey("SplashScreen"),
          child: SplashScreen(),
        ),
      ];

  List<Page> get _loggedOutStack => [
        MaterialPage(
            key: const ValueKey("WelcomePage"),
            child: WelcomeScreen(
              onClickLogin: () {
                isLogin = true;
                notifyListeners();
              },
              onClickRegister: () {
                isRegister = true;
                notifyListeners();
              },
            )),
        if (isLogin)
          MaterialPage(
            key: const ValueKey("LoginPage"),
            child: LoginScreen(
              onClickBack: () {
                isLogin = false;
                notifyListeners();
              },
              onLogin: () {
                isLoggedIn = true;
                notifyListeners();
              },
              onRegister: () {
                isRegister = true;
                notifyListeners();
              },
            ),
          ),
        if (isRegister)
          MaterialPage(
            key: const ValueKey("RegisterPage"),
            child: RegisterScreen(onClickBack: () {
              isRegister = false;
              notifyListeners();
            }, onRegister: () {
              isRegister = false;
              isLogin = true;
              notifyListeners();
            }),
          ),
      ];

  List<Page> get _loggedInStack => [
        MaterialPage(
          key: const ValueKey("StoriesListPage"),
          child: HomeScreen(
            onLogOut: () {
              isLoggedIn = false;
              isLogin = false;
              isRegister = false;
              notifyListeners();
            },
          ),
        ),
      ];
}
