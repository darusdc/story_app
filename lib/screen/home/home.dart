import 'package:dstory_app/common/styles.dart';
import 'package:dstory_app/providers/auth_provider.dart';
import 'package:dstory_app/widgets/platform_widget.dart';
import 'package:dstory_app/widgets/stories_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onLogOut});
  final Function() onLogOut;

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

  final List<Widget> _pages = [const NearStoryScreen(), const AllStoryScreen()];

  void _onTapBottomNavigator(value) {
    setState(() {
      pageIndex = value;
    });
  }

  Widget androidBuilder(BuildContext context) {
    AuthProvider auth = context.watch<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "DStory App",
              overflow: TextOverflow.clip,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
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
      ),
      body: _pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).colorScheme.onBackground,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.near_me), label: "Near me"),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.add,
          //       color: Theme.of(context).colorScheme.secondary,
          //     ),
          //     label: 'Make story'),

          BottomNavigationBarItem(icon: Icon(Icons.all_out), label: "All Story")
        ],
        onTap: _onTapBottomNavigator,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        label: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

Widget iosBuilder(BuildContext context) {
  return const CupertinoPageScaffold(child: Text("Logout"));
}

Widget webBuilder(BuildContext context) {
  return const Text('web');
}
