import 'package:freezed_annotation/freezed_annotation.dart';

import 'dart:convert';

part 'story.g.dart';
part 'story.freezed.dart';

AllStories allStoriesFromJson(String str) =>
    AllStories.fromJson(json.decode(str));

String allStoriesToJson(AllStories data) => json.encode(data.toJson());

@freezed
class AllStories with _$AllStories {
  const factory AllStories({
    required bool error,
    required String message,
    required List<ListStory> listStory,
  }) = _AllStories;

  factory AllStories.fromJson(Map<String, dynamic> json) =>
      _$AllStoriesFromJson(json);
  // AllStories(
  //       error: json["error"],
  //       message: json["message"],
  //       listStory: List<ListStory>.from(
  //           json["listStory"].map((x) => ListStory.fromJson(x))),
  //     );

  // Map<String, dynamic> toJson() => _$AllStoriesToJson(this);
  // {
  //       "error": error,
  //       "message": message,
  //       "listStory": List<dynamic>.from(listStory.map((x) => x.toJson())),
  //     };
}

@freezed
class ListStory with _$ListStory {
  const factory ListStory({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required DateTime createdAt,
    required dynamic lat,
    required dynamic lon,
  }) = _ListStory;

  factory ListStory.fromJson(Map<String, dynamic> json) =>
      _$ListStoryFromJson(json);
}

DetailStory detailStoryFromJson(String str) =>
    DetailStory.fromJson(json.decode(str));

String detailStoryToJson(DetailStory data) => json.encode(data.toJson());

@freezed
class DetailStory with _$DetailStory {
  const factory DetailStory({
    required bool error,
    required String message,
    required Story story,
  }) = _DetailStory;

  factory DetailStory.fromJson(Map<String, dynamic> json) =>
      _$DetailStoryFromJson(json);
}

SendStory sendStoryFromJson(String str) => SendStory.fromJson(json.decode(str));

String sendStoryToJson(SendStory data) => json.encode(data.toJson());

@freezed
class SendStory with _$SendStory {
  const factory SendStory({
    required bool error,
    required String message,
  }) = _SendStory;

  factory SendStory.fromJson(Map<String, dynamic> json) =>
      _$SendStoryFromJson(json);
}

@freezed
class Story with _$Story {
  const factory Story({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required DateTime createdAt,
    required dynamic lat,
    required dynamic lon,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
