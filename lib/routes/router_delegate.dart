import 'package:dstory_app/model/page_configuration.dart';
import 'package:dstory_app/screen/home/add_story.dart';
import 'package:dstory_app/screen/home/story.dart';
import 'package:dstory_app/screen/unknown_screen.dart';
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

  bool? isUnknown;

  AppRouterDelegate(
    this.authRepository,
  ) : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }

  _init() async {
    isLoggedIn = await authRepository.isLoggedIn();
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  List<Page> historyStack = [];
  bool? isLoggedIn;
  bool isLogin = false;
  bool isRegister = false;
  String idStory = "";
  bool isUpdateStory = false;

  @override
  Widget build(BuildContext context) {
    if (isUnknown == true) {
      historyStack = _unknownStack;
    } else if (isLoggedIn == null) {
      historyStack = _splashStack;
    } else if (isLoggedIn == true) {
      historyStack = _loggedInStack;
    } else {
      historyStack = _loggedOutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: historyStack,
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        isRegister = false;
        isLogin = false;
        idStory = '';
        isUpdateStory = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  PageConfiguration? get currentConfiguration {
    if (isLoggedIn == null) {
      return PageConfiguration.splash();
    } else if (isLoggedIn == false) {
      return PageConfiguration.welcome();
    } else if (isRegister == true) {
      return PageConfiguration.register();
    } else if (isLogin == true) {
      return PageConfiguration.login();
    } else if (isUnknown == true) {
      return PageConfiguration.unknown();
    } else if (idStory == '') {
      return PageConfiguration.home();
    } else if (idStory != '') {
      return PageConfiguration.detailStory(idStory);
    } else {
      return null;
    }
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    if (configuration.isUnknownPage) {
      isUnknown = true;
      isRegister = false;
    } else if (configuration.isRegisterPage) {
      isRegister = true;
    } else if (configuration.isHomePage ||
        configuration.isLoginPage ||
        configuration.isSplashPage) {
      isUnknown = false;
      idStory = '';
      isRegister = false;
    } else if (configuration.isDetailPage) {
      isUnknown = false;
      isRegister = false;
      idStory = configuration.idStory;
    } else {
      print(' Could not set new route');
    }

    notifyListeners();
  }

  List<Page> get _unknownStack => const [
        MaterialPage(
          key: ValueKey("UnknownPage"),
          child: UnknownScreen(),
        ),
      ];

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
            onClickStory: (String id) {
              idStory = id;
              notifyListeners();
            },
            onClickUpdateStory: () {
              isUpdateStory = true;
              notifyListeners();
            },
          ),
        ),
        if (idStory != "")
          MaterialPage(
            key: const ValueKey("DetailStory"),
            child: StoryScreen(
              id: idStory,
              onClickBack: () {
                idStory = "";
                notifyListeners();
              },
            ),
          ),
        if (isUpdateStory)
          MaterialPage(
            key: const ValueKey("UpdateStory"),
            child: AddStoryScreen(
              onClickBack: () {
                isUpdateStory = false;
                notifyListeners();
              },
              onClickUpdate: () {},
            ),
          ),
      ];
}
