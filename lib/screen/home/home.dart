import 'package:dstory_app/common/styles.dart';
import 'package:dstory_app/providers/auth_provider.dart';
import 'package:dstory_app/widgets/flag_icon_widget.dart';
import 'package:dstory_app/widgets/platform_widget.dart';
import 'package:dstory_app/widgets/stories_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key,
      required this.onLogOut,
      required this.onClickStory,
      required this.onClickUpdateStory});
  final Function() onLogOut;
  final Function(String id) onClickStory;
  final Function() onClickUpdateStory;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: androidBuilder,
      iosBuilder: iosBuilder,
      webBuilder: webBuilder,
    );
  }

  void _onTapBottomNavigator(value) {
    setState(() {
      pageIndex = value;
    });
  }

  Widget androidBuilder(BuildContext context) {
    AuthProvider auth = context.watch<AuthProvider>();
    bool isFree = FlavorConfig.instance.variables['isFree'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "DStory App ${isFree ? "Free" : ''}",
              overflow: TextOverflow.clip,
              style: isFree
                  ? Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary)
                  : Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary),
            ),
            Row(
              children: [
                const FlagIconWidget(),
                auth.isLoadingLogout
                    ? const CircularProgressIndicator()
                    : IconButton(
                        onPressed: () async {
                          await auth.logout();
                          widget.onLogOut();
                        },
                        icon: const Icon(Icons.logout),
                        color: Theme.of(context).colorScheme.onSecondary,
                        style: circleButton),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: [
            NearStoryScreen(
              onClickStory: (String id) {
                widget.onClickStory(id);
              },
            ),
            AllStoryScreen(onClickStory: (id) {
              widget.onClickStory(id);
            })
          ][pageIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).colorScheme.onBackground,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.near_me),
              label: AppLocalizations.of(context)!.bottomLabelNearMe),
          BottomNavigationBarItem(
              icon: const Icon(Icons.all_out),
              label: AppLocalizations.of(context)!.bottomLabelAllStory)
        ],
        onTap: _onTapBottomNavigator,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        label: const Icon(Icons.add),
        onPressed: () => widget.onClickUpdateStory(),
      ),
    );
  }

  Widget iosBuilder(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Row(children: [
            IconButton(
                onPressed: () => _onTapBottomNavigator(0),
                icon: const Icon(CupertinoIcons.location)),
            IconButton(
                onPressed: () => _onTapBottomNavigator(1),
                icon: const Icon(CupertinoIcons.layers_alt_fill))
          ]),
        ),
        child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: [
              NearStoryScreen(
                onClickStory: (String id) {
                  widget.onClickStory(id);
                },
              ),
              AllStoryScreen(onClickStory: (id) {
                widget.onClickStory(id);
              })
            ][pageIndex]));
  }

  Widget webBuilder(BuildContext context) {
    return const Text('web');
  }
}
