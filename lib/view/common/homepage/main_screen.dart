import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/provider/cart_provider.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:grozaar/core/utility/routes.dart';
import 'package:grozaar/view/authentication/registration_screen.dart';
import 'package:grozaar/view/common/category/category_screen.dart';
import 'package:grozaar/view/common/general/promotion_screen.dart';
import 'package:grozaar/view/profile/customer_profile_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/singleton/logger.dart';
import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/dialogUtil.dart';
import '../../../generated/assets.dart';
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

  int index = 0;

  @override
  void initState() {
    super.initState();
    context.read<CartProvider>().showCart(false);
    logged = SharedPref.getString(CustomStrings().token);
    _page = widget.initialIndex ?? 0;
    _pageController = PageController(initialPage: _page);
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
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: SizedBox(
            width: 45,
            height: 45,
            child: FloatingActionButton(
              backgroundColor: ProjectColors().primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(30),
              ),
              onPressed: () {
                Navigator.pushNamed(context, cartPage);
              },
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
                  context.watch<CartProvider>().cartResponse != null &&
                          context.watch<CartProvider>().cartResponse?.items !=
                              null &&
                          context
                              .watch<CartProvider>()
                              .cartResponse!
                              .items!
                              .isNotEmpty
                      ? Positioned(
                        right: 0,
                        top: 0,
                        child: Card(
                          color: ProjectColors().red1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(
                              width: 1,
                              color: ProjectColors().white,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.fromLTRB(5, 0, 5, 0),
                            child: Text(
                              context
                                  .watch<CartProvider>()
                                  .cartResponse!
                                  .items!
                                  .length
                                  .toString(),
                              style: GoogleFonts.raleway(
                                color: ProjectColors().white,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: onPageChanged,
          controller: _pageController,
          children: [
            HomePage(),
            CategoryPage(hideBack: true),
            logged.isNotEmpty
                ? CustomerProfilePage(hideBack: true)
                : RegistrationPage(hideBack: true),
            PromotionPage(hideBack: true),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: BottomNavigationBar(
            backgroundColor: ProjectColors().white,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 0,
            elevation: 10,
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
                  iconString: Assets.imagesIcUser,
                  isSelected: 2 == _page,
                  label: CustomStrings().profile,
                ),
                label: CustomStrings().profile,
              ),
              BottomNavigationBarItem(
                icon: NavItem(
                  iconString: Assets.imagesIcFab,
                  isSelected: 3 == _page,
                  label: CustomStrings().favourite,
                ),
                label: CustomStrings().favourite,
              ),
            ],
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
      child: Container(
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
                fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
