import 'package:dstory_app/databases/story_repository.dart';
import 'package:dstory_app/providers/story_provider.dart';
import 'package:dstory_app/widgets/stories_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key, required this.id, required this.onClickBack});
  final String id;
  final Function() onClickBack;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailStoryProvider>(
        create: (context) => DetailStoryProvider(StoryRepository(), id),
        child: Scaffold(
            appBar: AppBar(
                title: const Text("Story"),
                leading: IconButton(
                    onPressed: () {
                      onClickBack();
                    },
                    icon: const Icon(Icons.arrow_back))),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Consumer<DetailStoryProvider>(
                    builder: (context, value, child) {
                      if (value.state == ResultState.loading) {
                        return const CircularProgressIndicator();
                      } else if (value.state == ResultState.hasData) {
                        return storyFrame(context, value.detailStory.story);
                      } else {
                        return const Text("eror");
                      }
                    },
                  )
                ],
              ),
            )));
  }
}
