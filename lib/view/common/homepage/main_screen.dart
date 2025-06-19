import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:grozaar/view/authentication/registration_screen.dart';
import 'package:grozaar/view/cart/cart_screen.dart';
import 'package:grozaar/view/common/category/category_screen.dart';
import 'package:grozaar/view/common/general/promotion_screen.dart';
import 'package:grozaar/view/profile/customer_profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../core/singleton/logger.dart';
import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/dialogUtil.dart';
import '../../../generated/assets.dart';
import '../../authentication/login_screen.dart';
import 'home_screen.dart';

class MainPage extends StatefulWidget {
  final int? initialIndex;

  const MainPage({super.key, this.initialIndex});

  @override
  MainPageScreenState createState() => MainPageScreenState();
}

class MainPageScreenState extends State<MainPage> {
  String logged = "";
  PageController? _pageController;
  int _page = 0;
  GlobalKey btnKey = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  PersistentTabController? _controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    logged = SharedPref.getString(CustomStrings().token);
    _page = widget.initialIndex ?? 0;
    _pageController = PageController(initialPage: _page);
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        //bool shouldExit = await exitDialog();
        bool shouldExit = await DialogUtils.showNormalDialog(
          context,
          message: CustomStrings().exit,
          yesText: CustomStrings().yes,
          noText: CustomStrings().no,
        );
        if (shouldExit) {
          //exiting app
          exit(0);
        } else {
          Log().print("User chose not to exit");
        }
      },
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButton: SizedBox(
          width: 45,
          height: 45,
          child: FloatingActionButton(
          backgroundColor: ProjectColors().primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(30)),
          onPressed: () {},
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  Assets.imagesIcCart,
                  colorFilter:
                  index == 2
                      ? ColorFilter.mode(
                    ProjectColors().blue1,
                    BlendMode.srcIn,
                  )
                      : ColorFilter.mode(
                    ProjectColors().white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: ProjectColors().red1,
                  child: Text(
                    "",
                    style: GoogleFonts.raleway(
                      color: ProjectColors().white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: /*PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 50)],
          ),
          bottomScreenMargin: 10,
          handleAndroidBackButtonPress: false,
          // Default is true.
          resizeToAvoidBottomInset: false,
          // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
          stateManagement: true,
          // Default is true.
          hideNavigationBarWhenKeyboardAppears: true,
          popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
          padding: const EdgeInsets.only(top: 5, bottom: 0),
          backgroundColor: ProjectColors().white,
          isVisible: true,
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              duration: Duration(milliseconds: 200),
              screenTransitionAnimationType:
                  ScreenTransitionAnimationType.fadeIn,
            ),
          ),
          confineToSafeArea: true,
          navBarHeight: kBottomNavigationBarHeight,
          navBarStyle: NavBarStyle.style15,
          // Choose the na
          onItemSelected: (value) {
            index = value;
            setState(() {});
          }, // v bar style with this property
        ),*/ PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
          controller: _pageController,
          children: [
            HomePage(),
            CategoryPage(),
            CartPage(),
            CartPage(),
            logged.isNotEmpty ? CustomerProfilePage() : LoginPage(),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 0,
              elevation: 0,
              currentIndex: _page,
              onTap: (int index) {
                setState(() {
                  _page = index;
                });
                navigationTapped(index);
              },

              items: [
                BottomNavigationBarItem(
                  icon: NavItem(
                    iconString: Assets.imagesIcHome,
                    isSelected: 0 == _page,
                    label: CustomStrings().home,
                  ),
                  label: CustomStrings().home,
                ),
                BottomNavigationBarItem(
                  icon: NavItem(
                    iconString: Assets.imagesIcCategory,
                    isSelected: 1 == _page,
                    label: CustomStrings().categories,
                  ),
                  label: CustomStrings().categories,
                ),
                BottomNavigationBarItem(
                  icon: NavItem(
                    iconString: Assets.imagesIcFab,
                    isSelected: 2 == _page,
                    label: CustomStrings().favourite,
                  ),
                  label: CustomStrings().favourite,
                ),
                BottomNavigationBarItem(
                  icon: NavItem(
                    iconString: Assets.imagesIcUser,
                    isSelected: 3 == _page,
                    label: CustomStrings().profile,
                  ),
                  label: CustomStrings().profile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    _pageController?.animateToPage(
      page,
      duration: const Duration(milliseconds: 10),
      curve: Curves.ease,
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      CategoryPage(hideBack: true),
      logged.isNotEmpty
          ? CartPage(hideBack: true)
          : RegistrationPage(hideBack: true),
      PromotionPage(hideBack: true),
      logged.isNotEmpty
          ? CustomerProfilePage(hideBack: true)
          : RegistrationPage(hideBack: true),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Assets.imagesIcHome,
          colorFilter:
              index == 0
                  ? ColorFilter.mode(
                    ProjectColors().primaryColor,
                    BlendMode.srcIn,
                  )
                  : ColorFilter.mode(ProjectColors().blue1, BlendMode.srcIn),
        ),
        title: CustomStrings().home,
        activeColorPrimary: ProjectColors().primaryColor,
        textStyle: GoogleFonts.raleway(
          color:
              index == 0 ? ProjectColors().primaryColor : ProjectColors().blue1,
          fontSize: 12,
          fontWeight: index == 0 ? FontWeight.w800 : FontWeight.w600,
        ),
        inactiveColorPrimary: ProjectColors().blue1,
        contentPadding: 10,
        activeColorSecondary: ProjectColors().primaryColor,
        inactiveColorSecondary: ProjectColors().blue1,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Assets.imagesIcCategory,
          colorFilter:
              index == 1
                  ? ColorFilter.mode(
                    ProjectColors().primaryColor,
                    BlendMode.srcIn,
                  )
                  : ColorFilter.mode(ProjectColors().blue1, BlendMode.srcIn),
        ),
        title: CustomStrings().categories,
        activeColorPrimary: ProjectColors().primaryColor,
        textStyle: GoogleFonts.raleway(
          color:
              index == 0 ? ProjectColors().primaryColor : ProjectColors().blue1,
          fontSize: 12,
          fontWeight: index == 1 ? FontWeight.w800 : FontWeight.w600,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                Assets.imagesIcCart,
                colorFilter:
                    index == 2
                        ? ColorFilter.mode(
                          ProjectColors().blue1,
                          BlendMode.srcIn,
                        )
                        : ColorFilter.mode(
                          ProjectColors().white,
                          BlendMode.srcIn,
                        ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: ProjectColors().red1,
                child: Text(
                  "",
                  style: GoogleFonts.raleway(
                    color: ProjectColors().white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
        activeColorPrimary: ProjectColors().primaryColor,
        activeColorSecondary: ProjectColors().white,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Assets.imagesIcFab,
          colorFilter:
              index == 3
                  ? ColorFilter.mode(
                    ProjectColors().primaryColor,
                    BlendMode.srcIn,
                  )
                  : ColorFilter.mode(ProjectColors().blue1, BlendMode.srcIn),
        ),
        title: CustomStrings().favourite,
        activeColorPrimary: ProjectColors().primaryColor,
        textStyle: GoogleFonts.raleway(
          color: ProjectColors().blue1,
          fontSize: 12,
          fontWeight: index == 3 ? FontWeight.w800 : FontWeight.w600,
        ),
        inactiveColorPrimary: ProjectColors().blue1,
        contentPadding: 10,
        activeColorSecondary: ProjectColors().primaryColor,
        inactiveColorSecondary: ProjectColors().blue1,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          Assets.imagesIcUser,
          colorFilter:
              index == 4
                  ? ColorFilter.mode(
                    ProjectColors().primaryColor,
                    BlendMode.srcIn,
                  )
                  : ColorFilter.mode(ProjectColors().blue1, BlendMode.srcIn),
        ),
        title: CustomStrings().profile,
        activeColorPrimary: ProjectColors().primaryColor,
        textStyle: GoogleFonts.raleway(
          color: ProjectColors().blue1,
          fontSize: 12,
          fontWeight: index == 4 ? FontWeight.w800 : FontWeight.w600,
        ),
        inactiveColorPrimary: ProjectColors().blue1,
        contentPadding: 10,
        activeColorSecondary: ProjectColors().primaryColor,
        inactiveColorSecondary: ProjectColors().blue1,
      ),
    ];
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.isSelected,
    required this.iconString,
    required this.label,
  });

  final bool isSelected;
  final String label, iconString;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        /*color:
            isSelected ? ProjectColors().primaryColor : ProjectColors().white,*/
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconString,
              colorFilter:
                  isSelected
                      ? ColorFilter.mode(
                        ProjectColors().primaryColor,
                        BlendMode.srcIn,
                      )
                      : ColorFilter.mode(
                        ProjectColors().blue1,
                        BlendMode.srcIn,
                      ),
              height: 16,
              width: 16,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: GoogleFonts.raleway(
                color:
                    isSelected
                        ? ProjectColors().primaryColor
                        : ProjectColors().blue1,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
