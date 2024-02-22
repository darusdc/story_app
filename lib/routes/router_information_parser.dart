import 'package:flutter/material.dart';

import '../model/page_configuration.dart';

/// todo 3: create class RouteInformationParser
/// todo 5: add generic class to RouteInformationParser
class MyRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {
  /// todo 6: start the parsing process
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.uri.toString());

    if (uri.pathSegments.isEmpty) {
      // without path parameter => "/"
      return PageConfiguration.home();
    } else if (uri.pathSegments.length == 1) {
      // path parameter => "/aaa"
      final first = uri.pathSegments[0].toLowerCase();
      if (first == 'home') {
        return PageConfiguration.home();
      } else if (first == 'login') {
        return PageConfiguration.login();
      } else if (first == 'register') {
        return PageConfiguration.register();
      } else if (first == 'splash') {
        return PageConfiguration.splash();
      } else if (first == 'welcome') {
        return PageConfiguration.welcome();
      } else {
        return PageConfiguration.unknown();
      }
    } else if (uri.pathSegments.length == 2) {
      // path parameter => "/aaa/bbb"
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      if (first == 'story' && (second != '')) {
        return PageConfiguration.detailStory(second);
      } else {
        return PageConfiguration.unknown();
      }
    } else {
      return PageConfiguration.unknown();
    }
  }

  /// todo 7: restore the information ?
  @override
  RouteInformation? restoreRouteInformation(PageConfiguration configuration) {
    if (configuration.isUnknownPage) {
      return RouteInformation(uri: Uri(path: '/unknown'));
    } else if (configuration.isSplashPage) {
      return RouteInformation(uri: Uri(path: '/splash'));
    } else if (configuration.isRegisterPage) {
      return RouteInformation(uri: Uri(path: '/register'));
    } else if (configuration.isLoginPage) {
      return RouteInformation(uri: Uri(path: '/login'));
    } else if (configuration.isWelcomePage) {
      return RouteInformation(uri: Uri(path: '/welcome'));
    } else if (configuration.isHomePage) {
      return RouteInformation(uri: Uri(path: '/'));
    } else if (configuration.isDetailPage) {
      return RouteInformation(
          uri: Uri(path: '/story/${configuration.idStory}'));
    } else if (configuration.isUpdateStoryPage) {
      return RouteInformation(uri: Uri(path: '/update'));
    } else {
      return null;
    }
  }
}
