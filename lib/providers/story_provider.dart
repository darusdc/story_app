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
  }

  Future getNearMeStories() async {
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
  }
}

class DetailStoryProvider extends ChangeNotifier {
  final StoryRepository storyRepository;
  final String id;

  DetailStoryProvider(this.storyRepository, this.id) {
    getDetailStory(id);
  }

  late DetailStory detailStory;
  ResultState state = ResultState.noData;

  Future getDetailStory(String id) async {
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
  }
}
