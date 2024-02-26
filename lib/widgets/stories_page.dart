import 'package:dstory_app/model/story.dart';
import 'package:dstory_app/providers/story_provider.dart';
import 'package:dstory_app/widgets/state_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget _containerStory(BuildContext context, List<ListStory> stories,
    Function(String id) onClickStory) {
  return ListView(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    children: stories
        .map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(20)),
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(.8),
                          child: Text(
                            e.name,
                            overflow: TextOverflow.clip,
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      InkWell(
                        child: Hero(
                          tag: e.id,
                          child: Ink.image(
                            image: NetworkImage(e.photoUrl),
                            fit: BoxFit.cover,
                            width: 200,
                          ),
                        ),
                        onTap: () {
                          onClickStory(e.id);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ))
        .toList(),
  );
}

class NearStoryScreen extends StatelessWidget {
  const NearStoryScreen({super.key, required this.onClickStory});
  final Function(String id) onClickStory;

  @override
  Widget build(BuildContext context) {
    return Consumer<StoryProvider>(
      builder: (context, value, child) {
        // value.getNearMeStories();
        return stateWidget(
          context,
          value.state,
          _containerStory(
            context,
            value.nearStories,
            onClickStory,
          ),
          () => value.getNearMeStories(),
        );
      },
    );
  }
}

class AllStoryScreen extends StatelessWidget {
  const AllStoryScreen({super.key, required this.onClickStory});
  final Function(String id) onClickStory;
  @override
  Widget build(BuildContext context) {
    return Consumer<StoryProvider>(
      builder: (context, value, child) {
        // value.getAllStories();
        return stateWidget(
            context,
            value.state,
            _containerStory(context, value.allStories, onClickStory),
            () => value.getAllStories());
      },
    );
  }
}

Widget storyFrame(BuildContext context, Story story) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Hero(
          tag: story.id,
          child: Image.network(
            story.photoUrl,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const CircularProgressIndicator();
              } else {
                return child;
              }
            },
            fit: BoxFit.cover,
          ),
        ),
        Text(
          story.name,
          overflow: TextOverflow.clip,
          style: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.left,
        ),
        Text(
          story.description,
          overflow: TextOverflow.clip,
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.justify,
        ),
        Text(
          story.createdAt.toLocal().toString(),
          overflow: TextOverflow.clip,
          style: Theme.of(context).textTheme.displayLarge,
          textAlign: TextAlign.left,
        ),
      ],
    ),
  );
}
