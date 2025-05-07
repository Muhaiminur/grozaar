import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/provider/common_provider.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:provider/provider.dart';

import '../../../core/singleton/shared_pref.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageScreenState createState() => HomePageScreenState();
}

class HomePageScreenState extends State<HomePage> {
  String logged = "";
  int _carouselCurrent = 0;
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();

  @override
  void initState() {
    //context.read<CommonProvider>().homePageCall();
    super.initState();
    _loadHomeData(isReload: false);
  }

  _loadHomeData({required bool isReload}) {
    logged = SharedPref.getString(CustomStrings().token);
    context.read<CommonProvider>().homePageCall();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        backgroundColor: ProjectColors().primaryColor,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: ProjectColors().white,
          backgroundColor: ProjectColors().primaryColor,
          strokeWidth: 1.0,
          onRefresh: _handleRefresh,
          child: SingleChildScrollView(
            child: Container(
              color: ProjectColors().primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hey",
                          style: GoogleFonts.roboto(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: ProjectColors().white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        Text(
                          "Let’s search your grocery food",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ProjectColors().white2,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  //search bar
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: TextFormField(
                      style: GoogleFonts.roboto(
                        color: ProjectColors().blue1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: ProjectColors().white,
                        filled: true,
                        hintStyle: GoogleFonts.roboto(
                          color: ProjectColors().blue1,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(
                          20.0,
                          5.0,
                          20.0,
                          5.0,
                        ),
                        hintText: "Search your daily grocery food",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIconColor: ProjectColors().blue1,
                        prefixIcon: Icon(
                          Icons.search,
                          color: ProjectColors().blue1,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ProjectColors().white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Categories",
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ProjectColors().blue3,
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                "See All",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ProjectColors().blue2,
                                ),
                              ),
                              onTap: () {
                                /*Navigator.pushNamed(
                                  context,
                                  allFarmsPage,
                                  arguments: {
                                    'from': CustomStrings.allFarms,
                                    'farmTag': '',
                                  },
                                );*/
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        LimitedBox(maxHeight: 190, child: bestFarmViewList()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    _loadHomeData(isReload: true);
  }

  Widget bestFarmViewList() {
    return SizedBox();
  }
}
