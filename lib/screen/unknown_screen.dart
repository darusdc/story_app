import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset('assets/lotties/not-found.json'),
          Text("Url not found")
        ],
      ),
    );
  }
}
