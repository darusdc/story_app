import 'package:dstory_app/model/story.dart';
import 'package:dstory_app/providers/story_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

Widget _containerStory(BuildContext context, List<ListStory> stories) {
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
                        child: Ink.image(
                          image: NetworkImage(e.photoUrl),
                          fit: BoxFit.cover,
                          width: 200,
                        ),
                        onTap: () {
                          print(e.id);
                        },
                      )
                      // Image.network(
                      //   e.photoUrl,
                      //   fit: BoxFit.cover,
                      //   width: 200,
                      //   loadingBuilder: (context, child, loadingProgress) {
                      //     if (loadingProgress != null) {
                      //       return const CircularProgressIndicator();
                      //     } else {
                      //       return child;
                      //     }
                      //   },
                      // )
                    ],
                  ),
                ),
              ),
            ))
        .toList(),
  );
}

class NearStoryScreen extends StatelessWidget {
  const NearStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoryProvider>(builder: (context, value, child) {
      if (value.state == ResultState.loading) {
        return const CircularProgressIndicator();
      } else if (value.state == ResultState.noData) {
        return Center(
          child: Material(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                Lottie.asset('assets/lotties/no_data.json'),
                const Text("There is no data from server!"),
              ],
            ),
          ),
        );
      } else {
        return _containerStory(context, value.nearStories);
      }
    });
  }
}

class AllStoryScreen extends StatelessWidget {
  const AllStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StoryProvider>(builder: (context, value, child) {
      if (value.state == ResultState.loading) {
        return const CircularProgressIndicator();
      } else if (value.state == ResultState.noData) {
        return Center(
          child: Material(
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                Lottie.asset('assets/lotties/no_data.json'),
                const Text("There is no data from server!"),
              ],
            ),
          ),
        );
      } else {
        return _containerStory(context, value.allStories);
      }
    });
  }
}
