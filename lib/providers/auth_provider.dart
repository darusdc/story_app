import 'package:flutter/material.dart';
import 'package:dstory_app/databases/auth_repository.dart';

import '../model/user.dart';

/// todo 5: create Auth Provider to handle auth process
class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthProvider(this.authRepository);

  bool isLoadingLogin = false;
  bool isLoadingLogout = false;
  bool isLoadingRegister = false;
  bool isLoggedIn = false;

  Future<Map<bool, String>> login(String email, String password) async {
    isLoadingLogin = true;
    notifyListeners();

    final userState = await authRepository.getUser();
    Map<bool, String> result = {false: 'unknow error'};
    if (userState == "") {
      result = await authRepository.login(email, password);
    }
    isLoggedIn = await authRepository.isLoggedIn();

    isLoadingLogin = false;
    notifyListeners();

    return result;
  }

  Future<bool> logout() async {
    isLoadingLogout = true;
    notifyListeners();

    final logout = await authRepository.logout();
    if (logout) {
      await authRepository.deleteUser();
    }
    isLoggedIn = await authRepository.isLoggedIn();

    isLoadingLogout = false;
    notifyListeners();

    return isLoggedIn;
  }

  Future<Map<bool, String>> register(
      String name, String email, String password) async {
    isLoadingRegister = true;
    notifyListeners();
    final userState = await authRepository.getUser();
    Map<bool, String> result = {false: 'unknow error'};
    if (userState == "") {
      result = await authRepository.register(name, email, password);
    }
    isLoggedIn = await authRepository.isLoggedIn();

    isLoadingLogin = false;
    notifyListeners();

    return result;
  }

  Future<bool> saveUser(LoginResult user) async {
    isLoadingRegister = true;
    notifyListeners();

    final userState = await authRepository.saveUser(user);

    isLoadingRegister = false;
    notifyListeners();

    return userState;
  }
}
