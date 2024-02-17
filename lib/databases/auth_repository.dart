import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:dstory_app/constants/auth_constant.dart';
import '../model/user.dart';

class AuthRepository {
  Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    return preferences.getBool(stateKey) ?? false;
  }

  Future<Map<bool, String>> login(String email, String password) async {
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
        Uri.parse('$baseUrl/login'),
        headers: headers,
        body: json.encode(userData),
      );
      if (response.statusCode == 200) {
        final user = UserLogin.fromJson(jsonDecode(response.body));
        saveUser(user.loginResult);
        Map<bool, String> result = {
          true: 'berhasil',
        };
        preferences.setBool(stateKey, true);
        return result;
      } else if (response.statusCode == 401) {
        Map<bool, String> failed = {
          false: jsonDecode(response.body)["message"],
        };
        return failed;
      } else {
        Map<bool, String> failed = {
          false: 'Unknown Error ${response.statusCode}, ${response.body}',
        };
        return failed;
      }
    } catch (e) {
      throw Exception("Error while sending data, $e");
    }
  }

  Future<Map<bool, String>> register(
      String name, String email, String password) async {
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
        Uri.parse("$baseUrl/register"),
        headers: headers,
        body: json.encode(userData),
      );

      if (response.statusCode == 201) {
        return {true: "success"};
      } else {
        Map<bool, String> failed = {
          false: jsonDecode(response.body)["message"],
        };
        return failed;
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
