import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/provider/common_provider.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:grozaar/view/common/category/category_product_screen.dart';
import 'package:grozaar/view/common/category/category_screen.dart';
import 'package:grozaar/view/common/product/product_view.dart';
import 'package:provider/provider.dart';

import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/customColorLoader.dart';

class HomePage extends StatefulWidget {
  bool? hideBack;

  HomePage({super.key, this.hideBack});

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
      backgroundColor: ProjectColors().white,
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CategoryPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      LimitedBox(maxHeight: 230, child: categoryList()),
                      SizedBox(height: 10),
                      SizedBox(height: 5),
                      LimitedBox(
                        maxHeight: 125,
                        maxWidth: double.infinity,
                        child: bannerList(),
                      ),
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
                      SizedBox(height: 70),
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
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => CategoryProductPage(
                      args: {
                        "id":
                            context
                                .read<CommonProvider>()
                                .homeResponse
                                ?.data
                                ?.categories?[index]
                                ?.id ??
                            "",
                        "name":
                            context
                                .read<CommonProvider>()
                                .homeResponse
                                ?.data
                                ?.categories?[index]
                                ?.name ??
                            "",
                      },
                    ),
              ),
            );
          },
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
            return ProductView(
              id:
                  context
                      .read<CommonProvider>()
                      .homeResponse
                      ?.data
                      ?.newArrivalProducts?[position]
                      ?.id ??
                  "",
              imageUrl:
                  context
                      .watch<CommonProvider>()
                      .homeResponse
                      ?.data
                      ?.newArrivalProducts?[position]
                      ?.imageUrl ??
                  "",
              name:
                  context
                      .watch<CommonProvider>()
                      .homeResponse
                      ?.data
                      ?.newArrivalProducts?[position]
                      ?.name ??
                  "",
              price:
                  context
                      .watch<CommonProvider>()
                      .homeResponse
                      ?.data
                      ?.newArrivalProducts?[position]
                      ?.price ??
                  "",
              discount:
                  context
                      .watch<CommonProvider>()
                      .homeResponse
                      ?.data
                      ?.newArrivalProducts?[position]
                      ?.promotionText ??
                  "",
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
            return ProductView(
              id:
                  context
                      .read<CommonProvider>()
                      .homeResponse
                      ?.data
                      ?.bestSellingProducts?[position]
                      ?.id ??
                  "",
              imageUrl:
                  context
                      .watch<CommonProvider>()
                      .homeResponse
                      ?.data
                      ?.bestSellingProducts?[position]
                      ?.imageUrl ??
                  "",
              name:
                  context
                      .watch<CommonProvider>()
                      .homeResponse
                      ?.data
                      ?.bestSellingProducts?[position]
                      ?.name ??
                  "",
              price:
                  context
                      .watch<CommonProvider>()
                      .homeResponse
                      ?.data
                      ?.bestSellingProducts?[position]
                      ?.price ??
                  "",
              discount:
                  context
                      .watch<CommonProvider>()
                      .homeResponse
                      ?.data
                      ?.bestSellingProducts?[position]
                      ?.promotionText ??
                  "",
            );
          },
        )
        : ColorLoader();
  }

  Widget bannerList() {
    return context.watch<CommonProvider>().homeResponse != null &&
            context.watch<CommonProvider>().homeResponse?.data?.promotions !=
                null &&
            context
                .watch<CommonProvider>()
                .homeResponse!
                .data!
                .promotions!
                .isNotEmpty
        ? CarouselSlider(
          items: imageSliders(context),
          carouselController: _carouselSliderController,
          options: CarouselOptions(
            height: 125,
            enlargeCenterPage: false,
            autoPlay:
                context
                            .watch<CommonProvider>()
                            .homeResponse
                            ?.data
                            ?.promotions
                            ?.length !=
                        1
                    ? true
                    : false,
            viewportFraction: 1,
            padEnds: true,
            onPageChanged: (index, reason) {
              setState(() {
                _carouselCurrent = index;
              });
            },
          ),
        )
        : SizedBox();
  }

  List<Widget> imageSliders(BuildContext context) {
    return context
            .watch<CommonProvider>()
            .homeResponse
            ?.data
            ?.promotions
            ?.map(
              (item) => GestureDetector(
                onTap: () {
                  /*if (!item!.attributes!.inAppUrl!) {
            Log().openWebsite(item.attributes!.url!);
          } else if (item.attributes!.targetView!.isNotEmpty) {
            DeepLinkHandler.handleBannerLink(
              item.attributes?.targetView ?? "",
              item.attributes?.targetId ?? "",
            );
          }*/
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    child: CachedNetworkImage(
                      width: double.infinity,
                      imageUrl: item?.imageUrl ?? "",
                      placeholder:
                          (context, url) => Image.asset(
                            "assets/images/placeholder_image.png",
                            height: 125,
                            fit: BoxFit.cover,
                          ),
                      errorWidget:
                          (context, url, error) => Image.asset(
                            "assets/images/placeholder_image.png",
                            height: 125,
                            fit: BoxFit.cover,
                          ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )
            .toList() ??
        [];
  }
}
