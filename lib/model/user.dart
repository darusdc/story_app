import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

part 'user.freezed.dart';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

@freezed
class UserLogin with _$UserLogin {
  const factory UserLogin({
    required bool error,
    required String message,
    required LoginResult loginResult,
  }) = _UserLogin;

  factory UserLogin.fromJson(Map<String, dynamic> json) =>
      _$UserLoginFromJson(json);
  // UserLogin(
  //       error: json["error"],
  //       message: json["message"],
  //       loginResult: LoginResult.fromJson(json["loginResult"]),
  //     );

  // Map<String, dynamic> toJson() => _$UserLoginToJson(this);
  // {
  //       "error": error,
  //       "message": message,
  //       "loginResult": loginResult.toJson(),
  //     };
}

@freezed
class LoginResult with _$LoginResult {
  const factory LoginResult({
    required String userId,
    required String name,
    required String token,
  }) = _LoginResult;

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);
  // LoginResult(
  //       userId: json["userId"],
  //       name: json["name"],
  //       token: json["token"],
  //     );

  // Map<String, dynamic> toJson() => _$LoginResultToJson(this);
  // {
  //       "userId": userId,
  //       "name": name,
  //       "token": token,
  //     };
}
