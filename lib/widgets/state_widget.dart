import 'package:dstory_app/providers/story_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget stateWidget(BuildContext context, ResultState currentState, Widget child,
    Future Function() refresh) {
  if (currentState == ResultState.loading) {
    return const Center(child: CircularProgressIndicator());
  } else if (currentState == ResultState.hasData) {
    return child;
  } else if (currentState == ResultState.noData) {
    return Center(
      child: Column(
        children: [
          Lottie.asset('assets/lotties/no_data.json'),
          const Text("There is no data from server!"),
          IconButton(
              onPressed: () => refresh(), icon: const Icon(Icons.refresh))
        ],
      ),
    );
  } else if (currentState == ResultState.error) {
    return Center(
      child: Column(
        children: [
          Lottie.asset('assets/lotties/network_error.json'),
          const Text("Check your connection or server status!"),
          IconButton(
              onPressed: () => refresh(), icon: const Icon(Icons.refresh))
        ],
      ),
    );
  } else {
    return Center(
      child: Column(
        children: [
          Lottie.asset('assets/lotties/network_error.json'),
          const Text("Unknown Error"),
          IconButton(
              onPressed: () => refresh(), icon: const Icon(Icons.refresh))
        ],
      ),
    );
  }
}
