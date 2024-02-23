import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

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

      final data = DetailStory.fromJson(jsonDecode(result.body));
      return data;
    } catch (e) {
      throw Exception("Error while sending data, $e");
    }
  }

  Future<SendStory> sendStory(
      String description, File photo, double lat, double lon) async {
    final preference = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      'Authorization': 'Bearer ${preference.getString(userKey)}',
      'Content-Type': 'multipart/form-data'
    };

    final uri = Uri.parse('$baseUrl/stories');
    var request = http.MultipartRequest("POST", uri);
    try {
      final stat = await photo.stat();
      if (stat.size > 1024000) {
        throw Exception("File too big");
      }
      final multiPartFile = http.MultipartFile.fromBytes(
        "photo",
        photo.readAsBytesSync(),
        filename: photo.path,
      );
      final Map<String, String> fields = {
        "description": description,
      };

      request.files.add(multiPartFile);
      request.fields.addAll(fields);
      request.headers.addAll(headers);

      final http.StreamedResponse streamedResponse = await request.send();
      final int statusCode = streamedResponse.statusCode;

      final Uint8List responseList = await streamedResponse.stream.toBytes();
      final String responseData = String.fromCharCodes(responseList);

      if (statusCode == 201) {
        return SendStory.fromJson(jsonDecode(responseData));
      } else {
        throw Exception("Upload file error");
      }
    } catch (e) {
      throw Exception("$e");
    }
  }
}
