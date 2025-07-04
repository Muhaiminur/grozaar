import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grozaar/core/provider/auth_provider.dart';
import 'package:grozaar/view/authentication/login_screen.dart';
import 'package:grozaar/view/authentication/registration_screen.dart';
import 'package:grozaar/view/cart/cart_screen.dart';
import 'package:grozaar/view/cart/checkout_screen.dart';
import 'package:grozaar/view/common/category/category_product_screen.dart';
import 'package:grozaar/view/common/category/category_screen.dart';
import 'package:grozaar/view/common/general/notification_screen.dart';
import 'package:grozaar/view/common/general/promotion_screen.dart';
import 'package:grozaar/view/common/general/search_screen.dart';
import 'package:grozaar/view/common/homepage/home_screen.dart';
import 'package:grozaar/view/common/homepage/main_screen.dart';
import 'package:grozaar/view/common/order/order_list_screen.dart';
import 'package:grozaar/view/common/product/product_details_screen.dart';
import 'package:grozaar/view/common/product/product_list_screen.dart';
import 'package:grozaar/view/common/welcome_screen.dart';
import 'package:grozaar/view/profile/profile_edit_screen.dart';
import 'package:grozaar/view/splash_screen.dart';
import 'package:provider/provider.dart';

import '../core/provider/cart_provider.dart';
import '../core/provider/common_provider.dart';
import '../core/utility/keys.dart';
import '../core/utility/route_observer.dart';
import '../core/utility/routes.dart';
import 'common/order/order_details_screen.dart';
import 'profile/customer_profile_screen.dart';

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
        providers: [
          ChangeNotifierProvider(create: (_) => CommonProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => CartProvider()),
        ],
        child: MaterialApp(
          navigatorObservers: [routeObserver],
          navigatorKey: GlobalVariableKeys.navigatorState,
          //theme: iFarmerTheme(Brightness.light),
          initialRoute: splash,
          routes: {
            splash: (context) => const Splash(),
            welcomePage: (context) => const WelcomePage(),
            homePage: (context) => HomePage(),
            mainPage:
                (context) => MainPage(
                  initialIndex:
                      ModalRoute.of(context)!.settings.arguments as int,
                ),
            categoryPage: (context) => CategoryPage(),
            categoryProductPage:
                (context) => CategoryProductPage(
                  args: ModalRoute.of(context)!.settings.arguments as Map,
                ),
            productDetailsPage:
                (context) => ProductDetailsPage(
                  args: ModalRoute.of(context)!.settings.arguments as Map,
                ),
            cartPage: (context) => CartPage(),
            checkoutPage: (context) => const CheckoutPage(),
            registrationPage: (context) => RegistrationPage(),
            loginPage: (context) => const LoginPage(),
            profilePage: (context) => CustomerProfilePage(),
            profileEditPage: (context) => const ProfileEditPage(),
            orderListPage: (context) => const OrderListPage(),
            promotionPage: (context) => PromotionPage(),
            notificationPage: (context) => const NotificationPage(),
            searchPage: (context) => SearchPage(),
            orderDetailsPage:
                (context) => OrderDetailsPage(
                  args: ModalRoute.of(context)!.settings.arguments as Map,
                ),
            productListPage:
                (context) => ProductListPage(
                  args: ModalRoute.of(context)!.settings.arguments as Map,
                ),
          },
        ),
      ),
    );
  }
}
