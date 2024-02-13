import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:story_app/constants/auth_constant.dart';
import '../model/user.dart';

class AuthRepository {
  Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(stateKey) ?? false;
  }

  Future<bool> login(String email, String password) async {
    final preferences = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map<String, String> userData = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse('$baseUrl$loginUrl'),
        headers: headers,
        body: json.encode(userData),
      );
      if (response.statusCode == 200) {
        final user = UserLogin.fromJson(jsonDecode(response.body));
        saveUser(user.loginResult);
        return preferences.setBool(stateKey, true);
      } else if (response.statusCode == 401) {
        throw Exception('User not found or password is invalid');
      } else {
        throw Exception('Error connecting to server');
      }
    } catch (e) {
      throw Exception("Error while sending data, $e");
    }
  }

  Future<bool> register(String name, String email, String password) async {
    final preferences = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    Map<String, String> userData = {
      'name': name,
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse("$baseUrl$registerUrl"),
        headers: headers,
        body: json.encode(userData),
      );

      if (response.statusCode == 201) {
        return preferences.setBool(stateKey, false);
      } else if (response.statusCode == 401) {
        throw Exception('Email is already taken');
      } else {
        throw Exception('Error connecting to server');
      }
    } catch (e) {
      throw Exception("error while sending data: $e");
    }
  }

  Future<bool> logout() async {
    final preferences = await SharedPreferences.getInstance();
    deleteUser();
    return preferences.setBool(stateKey, false);
  }

  /// todo 4: add user manager to handle user information like email and password

  Future<bool> saveUser(LoginResult user) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(userKey, user.token);
  }

  Future<bool> deleteUser() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(userKey, "");
  }

  Future<String> getUser() async {
    final preferences = await SharedPreferences.getInstance();
    final json = preferences.getString(userKey) ?? "";
    return json;
  }
}
