import 'dart:convert';

import 'package:dstory_app/constants/auth_constant.dart';
import 'package:dstory_app/model/story.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StoryRepository {
  Future<AllStories> getAllStoriesRepo() async {
    final preference = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Authorization': 'Bearer ${preference.getString(userKey)}',
    };
    try {
      final result = await http.get(
        Uri.parse("$baseUrl/stories"),
        headers: headers,
      );

      if (result.statusCode == 200) {
        final data = AllStories.fromJson(jsonDecode(result.body));
        return data;
      } else {
        return AllStories.fromJson(
            {"error": false, "message": 'message', "listStory": []});
      }
    } catch (e) {
      throw Exception("Error while sending data, $e");
    }
  }

  Future<AllStories> getNearMeStoriesRepo() async {
    final preference = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Authorization': 'Bearer ${preference.getString(userKey)}',
    };
    try {
      final result = await http.get(Uri.parse("$baseUrl/stories?location=1"),
          headers: headers);

      if (result.statusCode == 200) {
        final data = AllStories.fromJson(jsonDecode(result.body));
        return data;
      } else {
        return AllStories.fromJson(
            {"error": true, "message": 'message', "listStory": []});
      }
    } catch (e) {
      throw Exception("Error while sending data, $e");
    }
  }

  Future<DetailStory> getDetailStoryRepo(String id) async {
    final preference = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Authorization': 'Bearer ${preference.getString(userKey)}',
    };
    try {
      final result =
          await http.get(Uri.parse("$baseUrl/stories/$id"), headers: headers);

      if (result.statusCode == 200) {
        final data = DetailStory.fromJson(jsonDecode(result.body));
        return data;
      } else {
        return DetailStory.fromJson(
            {"error": true, "message": 'message', "story": ""});
      }
    } catch (e) {
      throw Exception("Error while sending data, $e");
    }
  }
}
