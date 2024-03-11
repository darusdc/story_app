import 'package:dstory_app/databases/story_repository.dart';
import 'package:dstory_app/model/story.dart';
import 'package:dstory_app/providers/story_provider.dart';
import 'package:dstory_app/utils/get_location.dart';
import 'package:dstory_app/widgets/maps.dart';
import 'package:dstory_app/widgets/state_widget.dart';
import 'package:dstory_app/widgets/stories_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          title: Text(
            AppLocalizations.of(context)!.titleDetailStory,
            overflow: TextOverflow.clip,
          ),
          leading: IconButton(
            onPressed: () {
              onClickBack();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<DetailStoryProvider>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      stateWidget(
                        context,
                        storyFrame(
                          context,
                          value.state == ResultState.hasData
                              ? value.detailStory!.story
                              : Story(
                                  id: 'id',
                                  name: 'loading',
                                  description: 'loading',
                                  photoUrl:
                                      'https://i.giphy.com/3oEjI6SIIHBdRxXI40.webp',
                                  createdAt: DateTime(2024),
                                  lat: 'lat',
                                  lon: 'lon'),
                        ),
                        () => value.getDetailStory(id),
                      ),
                      if (value.detailStory != null && value.placemark != null)
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.mapText,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                                overflow: TextOverflow.clip,
                              ),
                              showMaps(
                                lon: value.detailStory!.story.lon,
                                lat: value.detailStory!.story.lat,
                                name: value.placemark!.name!,
                                snippet:
                                    '${value.placemark!.street!}, ${value.placemark!.subAdministrativeArea!}',
                              ),
                            ],
                          ),
                        )
                      else
                        const Text(""),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
