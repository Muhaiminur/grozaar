import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/provider/common_provider.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:grozaar/core/utility/routes.dart';
import 'package:provider/provider.dart';

import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/customColorLoader.dart';

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
      body: RefreshIndicator(
        color: ProjectColors().white,
        backgroundColor: ProjectColors().primaryColor,
        strokeWidth: 1.0,
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          child: Container(
            color: ProjectColors().primaryColor,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
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
                            CustomStrings().categories,
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ProjectColors().blue3,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              CustomStrings().seeAll,
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ProjectColors().blue2,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, categoryPage);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      LimitedBox(maxHeight: 230, child: categoryList()),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "New Arrivals",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ProjectColors().blue3,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              CustomStrings().seeAll,
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
                      LimitedBox(maxHeight: 230, child: newArrivalList()),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Best Selling",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ProjectColors().blue3,
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              CustomStrings().seeAll,
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
                      LimitedBox(maxHeight: 230, child: bestList()),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    _loadHomeData(isReload: true);
  }

  Widget categoryList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
      ),
      itemCount:
          context
              .watch<CommonProvider>()
              .homeResponse
              ?.data
              ?.categories
              ?.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: CachedNetworkImage(
                  height: 75,
                  width: 75,
                  imageUrl:
                      context
                          .watch<CommonProvider>()
                          .homeResponse
                          ?.data
                          ?.categories?[index]
                          ?.imageUrl ??
                      "",
                  placeholder:
                      (context, url) => Image.asset(
                        "assets/images/placeholder_image.png",
                        height: 75,
                        width: 75,
                        fit: BoxFit.cover,
                        scale: 10,
                      ),
                  errorWidget:
                      (context, url, error) => Image.asset(
                        "assets/images/placeholder_image.png",
                        height: 75,
                        width: 75,
                        fit: BoxFit.cover,
                        scale: 10,
                      ),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Text(
                  context
                          .watch<CommonProvider>()
                          .homeResponse
                          ?.data
                          ?.categories?[index]
                          ?.name ??
                      "",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ProjectColors().blue3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget newArrivalList() {
    return context.watch<CommonProvider>().homeResponse != null &&
            context
                    .watch<CommonProvider>()
                    .homeResponse
                    ?.data
                    ?.newArrivalProducts !=
                null &&
            context
                .watch<CommonProvider>()
                .homeResponse!
                .data!
                .newArrivalProducts!
                .isNotEmpty
        ? ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:
              context
                  .watch<CommonProvider>()
                  .homeResponse
                  ?.data
                  ?.newArrivalProducts
                  ?.length,
          itemBuilder: (BuildContext context, int position) {
            return GestureDetector(
              onTap: () {
                /*Navigator.pushNamed(
              context,
              farmDetailsPage,
              arguments: {
                'id':
                context
                    .read<HomeProvider>()
                    .homeResponse
                    ?.bestFarms
                    ?.elementAt(position)
                    ?.id
                    .toString(),
                'status':
                context
                    .read<HomeProvider>()
                    .homeResponse!
                    .bestFarms!
                    .elementAt(position)
                    ?.attributes
                    ?.status
                    .toString() ??
                    "",
              },
            );*/
              },
              child: Card(
                color: ProjectColors().white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: ProjectColors().white),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: CachedNetworkImage(
                            width: 140,
                            height: 140,
                            imageUrl:
                                context
                                    .watch<CommonProvider>()
                                    .homeResponse
                                    ?.data
                                    ?.newArrivalProducts?[position]
                                    ?.imageUrl ??
                                "",
                            placeholder:
                                (context, url) => Image.asset(
                                  "assets/images/placeholder_image.png",
                                  height: 140,
                                  width: 140,
                                ),
                            errorWidget:
                                (context, url, error) => Image.asset(
                                  "assets/images/placeholder_image.png",
                                  height: 140,
                                  width: 140,
                                ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          context
                                  .watch<CommonProvider>()
                                  .homeResponse
                                  ?.data
                                  ?.newArrivalProducts?[position]
                                  ?.name ??
                              "",
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ProjectColors().blue3,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                context
                                        .watch<CommonProvider>()
                                        .homeResponse
                                        ?.data
                                        ?.newArrivalProducts?[position]
                                        ?.price ??
                                    "",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ProjectColors().blue3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: WidgetStateProperty.all(Size.zero),
                                // Set
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all(
                                  ProjectColors().primaryColor,
                                ),
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.all(5),
                                ),
                                textStyle: WidgetStateProperty.all(
                                  TextStyle(
                                    fontSize: 12,
                                    color: ProjectColors().white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "ADD",
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ProjectColors().white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
        : ColorLoader();
  }

  Widget bestList() {
    return context.watch<CommonProvider>().homeResponse != null &&
            context
                    .watch<CommonProvider>()
                    .homeResponse
                    ?.data
                    ?.bestSellingProducts !=
                null &&
            context
                .watch<CommonProvider>()
                .homeResponse!
                .data!
                .bestSellingProducts!
                .isNotEmpty
        ? ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:
              context
                  .watch<CommonProvider>()
                  .homeResponse
                  ?.data
                  ?.bestSellingProducts
                  ?.length,
          itemBuilder: (BuildContext context, int position) {
            return GestureDetector(
              onTap: () {
                /*Navigator.pushNamed(
              context,
              farmDetailsPage,
              arguments: {
                'id':
                context
                    .read<HomeProvider>()
                    .homeResponse
                    ?.bestFarms
                    ?.elementAt(position)
                    ?.id
                    .toString(),
                'status':
                context
                    .read<HomeProvider>()
                    .homeResponse!
                    .bestFarms!
                    .elementAt(position)
                    ?.attributes
                    ?.status
                    .toString() ??
                    "",
              },
            );*/
              },
              child: Card(
                color: ProjectColors().white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: ProjectColors().white),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: CachedNetworkImage(
                            width: 140,
                            height: 140,
                            imageUrl:
                                context
                                    .watch<CommonProvider>()
                                    .homeResponse
                                    ?.data
                                    ?.bestSellingProducts?[position]
                                    ?.imageUrl ??
                                "",
                            placeholder:
                                (context, url) => Image.asset(
                                  "assets/images/placeholder_image.png",
                                  height: 140,
                                  width: 140,
                                ),
                            errorWidget:
                                (context, url, error) => Image.asset(
                                  "assets/images/placeholder_image.png",
                                  height: 140,
                                  width: 140,
                                ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          context
                                  .watch<CommonProvider>()
                                  .homeResponse
                                  ?.data
                                  ?.bestSellingProducts?[position]
                                  ?.name ??
                              "",
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ProjectColors().blue3,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                context
                                        .watch<CommonProvider>()
                                        .homeResponse
                                        ?.data
                                        ?.bestSellingProducts?[position]
                                        ?.price ??
                                    "",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ProjectColors().blue3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: WidgetStateProperty.all(Size.zero),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all(
                                  ProjectColors().primaryColor,
                                ),
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.all(5),
                                ),
                                textStyle: WidgetStateProperty.all(
                                  TextStyle(
                                    fontSize: 12,
                                    color: ProjectColors().white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "ADD",
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ProjectColors().white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
        : ColorLoader();
  }
}
