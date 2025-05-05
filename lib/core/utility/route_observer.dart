import 'package:flutter/material.dart';
import 'package:grozaar/core/singleton/logger.dart';

import 'keys.dart';

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (route is PageRoute) {
      GlobalVariableKeys.currentRouteName = route.settings.name;
      Log().printInfo('Route Pushed: ${GlobalVariableKeys.currentRouteName}');
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute is PageRoute) {
      GlobalVariableKeys.currentRouteName = previousRoute.settings.name;
      Log().printInfo('Route Popped: ${GlobalVariableKeys.currentRouteName}');
    }
    super.didPop(route, previousRoute);
  }
}
