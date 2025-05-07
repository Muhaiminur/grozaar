import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grozaar/view/common/homepage/home_screen.dart';
import 'package:grozaar/view/common/welcome_screen.dart';
import 'package:grozaar/view/splash_screen.dart';
import 'package:provider/provider.dart';

import '../core/provider/common_provider.dart';
import '../core/utility/keys.dart';
import '../core/utility/route_observer.dart';
import '../core/utility/routes.dart';

class Grozaar extends StatefulWidget {
  Grozaar({super.key});

  @override
  _GrozaarState createState() => _GrozaarState();
}

class _GrozaarState extends State<Grozaar> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MyRouteObserver routeObserver = MyRouteObserver();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => CommonProvider())],
        child: MaterialApp(
          navigatorObservers: [routeObserver],
          navigatorKey: GlobalVariableKeys.navigatorState,
          //theme: iFarmerTheme(Brightness.light),
          initialRoute: splash,
          routes: {
            splash: (context) => const Splash(),
            welcomePage: (context) => const WelcomePage(),
            homePage: (context) => const HomePage(),
          },
        ),
      ),
    );
  }
}
