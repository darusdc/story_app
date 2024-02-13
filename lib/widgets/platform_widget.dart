import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class PlatformWidget extends StatelessWidget {
  const PlatformWidget(
      {super.key, required this.androidBuilder, required this.iosBuilder, required this.webBuilder});
  
  final WidgetBuilder androidBuilder;
  final WidgetBuilder iosBuilder;
  final WidgetBuilder webBuilder;


  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return webBuilder(context);
    } else {
      switch (defaultTargetPlatform){
        case TargetPlatform.android:
          return androidBuilder(context);
        case TargetPlatform.iOS:
          return iosBuilder(context);
        default:
          return androidBuilder(context);
      }
    }
  }
}
