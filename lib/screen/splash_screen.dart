import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        "assets/images/imagination-6940837_1280.webp",
        fit: BoxFit.fill,
        width: 800,
      ),
      const SizedBox(
        height: 30,
      ),
      Center(
        child: Text("DStory - Place to share your dreams",
            overflow: TextOverflow.clip,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Theme.of(context).colorScheme.secondary),
            textAlign: TextAlign.center),
      ),
    ])));
  }
}
