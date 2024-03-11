import 'package:dstory_app/common/styles.dart';
import 'package:dstory_app/databases/auth_repository.dart';
import 'package:dstory_app/databases/story_repository.dart';
import 'package:dstory_app/providers/auth_provider.dart';
import 'package:dstory_app/providers/localization_provider.dart';
import 'package:dstory_app/providers/story_provider.dart';
import 'package:dstory_app/routes/router_delegate.dart';
import 'package:dstory_app/routes/router_information_parser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late AppRouterDelegate appRouterDelegate;
  late AuthProvider authProvider;
  late StoryProvider storyProvider;
  late LocalizationProvider localizationProvider;
  late MyRouteInformationParser appRouterInformationParser;

  @override
  void initState() {
    super.initState();
    final authRepository = AuthRepository();
    final storyRepository = StoryRepository();

    authProvider = AuthProvider(authRepository);
    storyProvider = StoryProvider(storyRepository);
    appRouterDelegate = AppRouterDelegate(authRepository);
    appRouterInformationParser = MyRouteInformationParser();
    localizationProvider = LocalizationProvider();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => authProvider,
        ),
        ChangeNotifierProvider(create: (context) => storyProvider),
        ChangeNotifierProvider(create: (context) => localizationProvider)
      ],
      builder: (context, child) => MaterialApp(
        title: 'DStory App',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: context.watch<LocalizationProvider>().locale,
        theme: lightTheme,
        home: Router(
          routerDelegate: appRouterDelegate,
          routeInformationParser: appRouterInformationParser,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );
  }
}
