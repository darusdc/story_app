import 'package:dstory_app/model/story.dart';
import 'package:dstory_app/providers/story_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget _containerStory(BuildContext context, List<ListStory> stories,
    Function(String id) onClickStory, ScrollController sc, int? pageItems,
    {String type = "All"}) {
  return RefreshIndicator(
    onRefresh: type == "All"
        ? () async =>
            await context.read<StoryProvider>().getAllStories(refresh: true)
        : () async =>
            await context.read<StoryProvider>().getNearMeStories(refresh: true),
    child: ListView.builder(
      controller: sc,
      physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: stories.length + 1,
      itemBuilder: (context, index) {
        if (index < stories.length) {
          final e = stories[index];
          return Padding(
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
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: pageItems != null
                  ? const CircularProgressIndicator()
                  : const Text(""),
            ),
          );
        }
      },
    ),
  );
}

class NearStoryScreen extends StatefulWidget {
  const NearStoryScreen({super.key, required this.onClickStory});
  final Function(String id) onClickStory;

  @override
  State<NearStoryScreen> createState() => _NearStoryScreenState();
}

class _NearStoryScreenState extends State<NearStoryScreen> {
  final sc = ScrollController();
  @override
  void initState() {
    super.initState();
    final storyProvider = context.read<StoryProvider>();

    sc.addListener(() async {
      if (sc.offset == sc.position.maxScrollExtent) {
        if (storyProvider.pageItemsNear != null) {
          await storyProvider.getNearMeStories();
        }
      }
    });

    Future.microtask(() async => storyProvider.getNearMeStories());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoryProvider>(
      builder: (context, value, child) => _containerStory(context,
          value.nearStories, widget.onClickStory, sc, value.pageItemsNear,
          type: "Near"),
    );
  }
}

class AllStoryScreen extends StatefulWidget {
  const AllStoryScreen({super.key, required this.onClickStory});
  final Function(String id) onClickStory;

  @override
  State<AllStoryScreen> createState() => _AllStoryScreenState();
}

class _AllStoryScreenState extends State<AllStoryScreen> {
  final sc = ScrollController();
  @override
  void initState() {
    super.initState();
    final storyProvider = context.read<StoryProvider>();

    sc.addListener(() async {
      if (sc.offset == sc.position.maxScrollExtent) {
        if (storyProvider.pageItemsAll != null) {
          await storyProvider.getAllStories();
        }
      }
    });

    Future.microtask(() async => storyProvider.getAllStories());
  }

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoryProvider>(builder: (context, value, child) {
      return _containerStory(context, value.allStories, widget.onClickStory, sc,
          value.pageItemsAll);
    });
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
