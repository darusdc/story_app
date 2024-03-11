// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllStoriesImpl _$$AllStoriesImplFromJson(Map<String, dynamic> json) =>
    _$AllStoriesImpl(
      error: json['error'] as bool,
      message: json['message'] as String,
      listStory: (json['listStory'] as List<dynamic>)
          .map((e) => ListStory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AllStoriesImplToJson(_$AllStoriesImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'listStory': instance.listStory,
    };

_$ListStoryImpl _$$ListStoryImplFromJson(Map<String, dynamic> json) =>
    _$ListStoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      photoUrl: json['photoUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lat: json['lat'],
      lon: json['lon'],
    );

Map<String, dynamic> _$$ListStoryImplToJson(_$ListStoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$DetailStoryImpl _$$DetailStoryImplFromJson(Map<String, dynamic> json) =>
    _$DetailStoryImpl(
      error: json['error'] as bool,
      message: json['message'] as String,
      story: Story.fromJson(json['story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailStoryImplToJson(_$DetailStoryImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'story': instance.story,
    };

_$SendStoryImpl _$$SendStoryImplFromJson(Map<String, dynamic> json) =>
    _$SendStoryImpl(
      error: json['error'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$SendStoryImplToJson(_$SendStoryImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
    };

_$StoryImpl _$$StoryImplFromJson(Map<String, dynamic> json) => _$StoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      photoUrl: json['photoUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lat: json['lat'],
      lon: json['lon'],
    );

Map<String, dynamic> _$$StoryImplToJson(_$StoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'lat': instance.lat,
      'lon': instance.lon,
    };
