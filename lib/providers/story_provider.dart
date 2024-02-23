import 'dart:io';

import 'package:dstory_app/databases/story_repository.dart';
import 'package:dstory_app/model/story.dart';
import 'package:flutter/material.dart';

enum ResultState {
  loading,
  noData,
  hasData,
  error,
}

class StoryProvider extends ChangeNotifier {
  final StoryRepository storyRepository;

  StoryProvider(this.storyRepository) {
    getAllStories();
    getNearMeStories();
  }

  late List<ListStory> allStories;
  late List<ListStory> nearStories;

  ResultState state = ResultState.noData;

  Future getAllStories() async {
    try {
      state = ResultState.loading;
      notifyListeners();

      final data = await storyRepository.getAllStoriesRepo();
      if (data.listStory.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        notifyListeners();
      }
      allStories = data.listStory;
      notifyListeners();
    } catch (e) {
      state = ResultState.error;
      allStories = [];
      notifyListeners();
    }
  }

  Future getNearMeStories() async {
    try {
      state = ResultState.loading;
      notifyListeners();

      final data = await storyRepository.getNearMeStoriesRepo();
      if (data.listStory.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        notifyListeners();
      }
      nearStories = data.listStory;
      notifyListeners();
    } catch (e) {
      state = ResultState.error;
      nearStories = [];
      notifyListeners();
    }
  }

  Future<SendStory> sendStory(
      String description, File photo, double lat, double lon) async {
    try {
      state = ResultState.loading;
      notifyListeners();

      final response =
          await storyRepository.sendStory(description, photo, lat, lon);

      if (response.error == false) {
        state = ResultState.hasData;
        notifyListeners();
      } else {
        state = ResultState.error;
        notifyListeners();
      }
      return response;
    } catch (e) {
      state = ResultState.error;
      notifyListeners();
      return SendStory(error: true, message: '$e');
    }
  }
}

class DetailStoryProvider extends ChangeNotifier {
  final StoryRepository storyRepository;
  final String id;

  DetailStoryProvider(this.storyRepository, this.id) {
    getDetailStory(id);
  }

  DetailStory? detailStory;
  ResultState state = ResultState.noData;

  Future getDetailStory(String id) async {
    try {
      state = ResultState.loading;
      notifyListeners();

      final response = await storyRepository.getDetailStoryRepo(id);
      if (response.story.id.isEmpty) {
        state = ResultState.noData;
        notifyListeners();
      } else {
        state = ResultState.hasData;
        notifyListeners();
      }
      detailStory = response;
      notifyListeners();
    } catch (e) {
      state = ResultState.error;
      detailStory = DetailStory(
          error: true,
          message: '$e',
          story: Story(
              id: 'x',
              name: 'name',
              description: 'description',
              photoUrl: 'photoUrl',
              createdAt: DateTime(2024),
              lat: 'lat',
              lon: 'lon'));
      notifyListeners();
    }
  }
}
