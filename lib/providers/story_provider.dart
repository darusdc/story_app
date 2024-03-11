import 'dart:io';

import 'package:dstory_app/constants/auth_constant.dart';
import 'package:dstory_app/databases/story_repository.dart';
import 'package:dstory_app/model/story.dart';
import 'package:dstory_app/utils/get_location.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

enum ResultState {
  loading,
  noData,
  hasData,
  error,
}

class StoryProvider extends ChangeNotifier {
  final StoryRepository storyRepository;

  StoryProvider(this.storyRepository);

  List<ListStory> allStories = [];
  List<ListStory> nearStories = [];
  int? pageItemsAll = 1;
  int? pageItemsNear = 1;
  ResultState state = ResultState.noData;

  Future getAllStories({bool refresh = false}) async {
    try {
      state = ResultState.loading;
      notifyListeners();
      if (refresh || pageItemsAll == 1) {
        pageItemsAll = 1;
        allStories = [];
      }
      if (pageItemsAll != null) {
        final data =
            await storyRepository.getAllStoriesRepo(page: pageItemsAll);
        if (data.listStory.isEmpty) {
          state = ResultState.noData;
        } else {
          state = ResultState.hasData;
          allStories.addAll(data.listStory);
        }
        // allStories = data.listStory;
        if (data.listStory.length < pageSize) {
          pageItemsAll = null;
          state = ResultState.hasData;
        } else {
          pageItemsAll = pageItemsAll! + 1;
        }
      }
      if (allStories.isNotEmpty) {
        state = ResultState.hasData;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      allStories = [];
      notifyListeners();
    }
  }

  Future getNearMeStories({bool refresh = false}) async {
    try {
      state = ResultState.loading;
      notifyListeners();
      if (refresh) {
        pageItemsNear = 1;
        nearStories = [];
      }
      if (pageItemsNear != null) {
        final data = await storyRepository.getNearMeStoriesRepo(
            pageItems: pageItemsNear);
        if (data.listStory.isEmpty && pageItemsNear != null) {
          state = ResultState.noData;
        } else {
          state = ResultState.hasData;
          if (pageItemsNear != null) {
            nearStories.addAll(data.listStory);
          }
        }
        if (data.listStory.length < pageSize) {
          pageItemsNear = null;
        } else {
          pageItemsNear = pageItemsNear! + 1;
        }
        notifyListeners();
      }
      if (nearStories.isNotEmpty) {
        state = ResultState.hasData;
        notifyListeners();
      }
    } catch (e) {
      state = ResultState.error;
      nearStories = [];
      notifyListeners();
    }
  }

  Future<SendStory> sendStory(String description, File photo,
      {double? lat, double? lon}) async {
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
  Placemark? placemark;

  Future getDetailStory(String id) async {
    try {
      state = ResultState.loading;
      notifyListeners();

      final response = await storyRepository.getDetailStoryRepo(id);
      if (response.story.id.isEmpty) {
        state = ResultState.noData;
      } else {
        state = ResultState.hasData;
      }
      detailStory = response;
      if (detailStory?.story.lat != null){
      placemark =
          await getLocation(detailStory?.story.lat, detailStory?.story.lon);
      }
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
              photoUrl: 'https://i.giphy.com/3oEjI6SIIHBdRxXI40.webp',
              createdAt: DateTime(2024),
              lat: 'lat',
              lon: 'lon'));
      notifyListeners();
    }
  }
}
