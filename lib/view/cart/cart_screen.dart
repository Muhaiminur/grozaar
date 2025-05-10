import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/provider/common_provider.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:provider/provider.dart';

import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/customColorLoader.dart';
import '../../../core/utility/custom_appbar.dart';
import '../../../core/utility/routes.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  CartPageScreenState createState() => CartPageScreenState();
}

class CartPageScreenState extends State<CartPage> {
  String logged = "";
  String cat = "";
  String counter = "1";

  @override
  void initState() {
    super.initState();
    _loadHomeData(isReload: false);
  }

  _loadHomeData({required bool isReload}) {
    logged = SharedPref.getString(CustomStrings().token);
    context.read<CommonProvider>().categoryProductCall("1", "1", "20");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight), // Set
        child: CustomAppBar(
          title: CustomStrings().cart,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: RefreshIndicator(
        color: ProjectColors().white,
        backgroundColor: ProjectColors().primaryColor,
        strokeWidth: 1.0,
        onRefresh: _handleRefresh,
        child: SingleChildScrollView(
          child: Container(
            color: ProjectColors().primaryColor,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ProjectColors().white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                spacing: 5,
                children: [
                  cartList(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ProjectColors().blue1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),

                      Text(
                        "100",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ProjectColors().blue1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(height: 1, color: ProjectColors().white3),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Charge",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ProjectColors().blue1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),

                      Text(
                        "100",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ProjectColors().blue1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(height: 1, color: ProjectColors().white3),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ProjectColors().blue1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),

                      Text(
                        "100",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ProjectColors().blue1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(height: 1, color: ProjectColors().white3),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ProjectColors().primaryColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),

                      Text(
                        "100",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ProjectColors().primaryColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(Size.zero),
                      // Set
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23),
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(
                        ProjectColors().primaryColor,
                      ),
                      padding: WidgetStateProperty.all(
                        EdgeInsets.fromLTRB(45, 10, 45, 10),
                      ),
                      textStyle: WidgetStateProperty.all(
                        TextStyle(
                          fontSize: 16,
                          color: ProjectColors().white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Checkout",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ProjectColors().white,
                      ),
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

  Widget cartList() {
    return context.watch<CommonProvider>().productResponse != null &&
            context.watch<CommonProvider>().productResponse?.data?.data !=
                null &&
            context
                .watch<CommonProvider>()
                .productResponse!
                .data!
                .data!
                .isNotEmpty
        ? ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:
              context
                  .watch<CommonProvider>()
                  .productResponse
                  ?.data
                  ?.data
                  ?.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: ProjectColors().white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  spacing: 10,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: CachedNetworkImage(
                        height: 90,
                        width: 90,
                        imageUrl:
                            context
                                .watch<CommonProvider>()
                                .productResponse
                                ?.data
                                ?.data?[index]
                                ?.imageUrl ??
                            "",
                        placeholder:
                            (context, url) => Image.asset(
                              "assets/images/placeholder_image.png",
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                        errorWidget:
                            (context, url, error) => Image.asset(
                              "assets/images/placeholder_image.png",
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  context
                                          .watch<CommonProvider>()
                                          .productResponse
                                          ?.data
                                          ?.data?[index]
                                          ?.name ??
                                      "",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: ProjectColors().blue3,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.close,
                                  color: ProjectColors().blue5,
                                  size: 12,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            context
                                    .watch<CommonProvider>()
                                    .productResponse
                                    ?.data
                                    ?.data?[index]
                                    ?.category
                                    ?.name ??
                                "",
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: ProjectColors().blue1,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                context
                                        .watch<CommonProvider>()
                                        .productResponse
                                        ?.data
                                        ?.data?[index]
                                        ?.price ??
                                    "0",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: ProjectColors().blue2,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "/${context.watch<CommonProvider>().productResponse?.data?.data?[index]?.productUnit?.name ?? ""}",
                                style: GoogleFonts.roboto(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: ProjectColors().blue2,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  if (int.parse(counter) > 1 &&
                                      int.parse(counter) <
                                          int.parse(
                                            context
                                                    .watch<CommonProvider>()
                                                    .productResponse
                                                    ?.data
                                                    ?.data?[index]
                                                    ?.totalStockQuantity ??
                                                "1",
                                          )) {
                                    int num = int.parse(counter) - 1;
                                    counter = num.toString();
                                  }
                                  setState(() {});
                                },
                                icon: Icon(Icons.remove_circle_outline_sharp),
                                color: ProjectColors().blue1,
                                iconSize: 20,
                              ),
                              Text(
                                counter,
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ProjectColors().blue3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                context
                                        .watch<CommonProvider>()
                                        .productResponse
                                        ?.data
                                        ?.data?[index]
                                        ?.productUnit
                                        ?.name ??
                                    "",
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ProjectColors().blue3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (int.parse(counter) >= 1 &&
                                        int.parse(counter) <
                                            int.parse(
                                              context
                                                      .watch<CommonProvider>()
                                                      .productResponse
                                                      ?.data
                                                      ?.data?[index]
                                                      ?.totalStockQuantity ??
                                                  "1",
                                            )) {
                                      int num = int.parse(counter) + 1;
                                      counter = num.toString();
                                    }
                                  });
                                },
                                icon: Icon(Icons.add_circle),
                                color: ProjectColors().primaryColor,
                                iconSize: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
        : ColorLoader();
  }

  Widget productList() {
    return context.watch<CommonProvider>().productResponse != null &&
            context.watch<CommonProvider>().productResponse?.data?.data !=
                null &&
            context
                .watch<CommonProvider>()
                .productResponse!
                .data!
                .data!
                .isNotEmpty
        ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount:
              context
                  .watch<CommonProvider>()
                  .productResponse
                  ?.data
                  ?.data
                  ?.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  productDetailsPage,
                  arguments: {
                    "id":
                        context
                            .read<CommonProvider>()
                            .productResponse
                            ?.data
                            ?.data?[index]
                            ?.id ??
                        "",
                  },
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
                      height: 110,
                      width: 110,
                      imageUrl:
                          context
                              .watch<CommonProvider>()
                              .productResponse
                              ?.data
                              ?.data?[index]
                              ?.imageUrl ??
                          "",
                      placeholder:
                          (context, url) => Image.asset(
                            "assets/images/placeholder_image.png",
                            height: 110,
                            width: 110,
                            fit: BoxFit.cover,
                          ),
                      errorWidget:
                          (context, url, error) => Image.asset(
                            "assets/images/placeholder_image.png",
                            height: 110,
                            width: 110,
                            fit: BoxFit.cover,
                          ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      context
                              .watch<CommonProvider>()
                              .productResponse
                              ?.data
                              ?.data?[index]
                              ?.name ??
                          "",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ProjectColors().blue3,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3, right: 3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: ProjectColors().yellow,
                          size: 12,
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            context
                                    .watch<CommonProvider>()
                                    .productResponse
                                    ?.data
                                    ?.data?[index]
                                    ?.rating
                                    ?.averageRating ??
                                "0",
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ProjectColors().blue1,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            "(${context.watch<CommonProvider>().productResponse?.data?.data?[index]?.rating?.totalReviewCount ?? "0"}+)",
                            style: GoogleFonts.roboto(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: ProjectColors().blue1,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3, right: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            context
                                    .watch<CommonProvider>()
                                    .productResponse
                                    ?.data
                                    ?.data?[index]
                                    ?.price ??
                                "0",
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
                            padding: WidgetStateProperty.all(EdgeInsets.all(5)),
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
                  ),
                ],
              ),
            );
          },
        )
        : context.watch<CommonProvider>().productResponse != null &&
            context.watch<CommonProvider>().productResponse?.data?.data !=
                null &&
            context.watch<CommonProvider>().productResponse!.data!.data!.isEmpty
        ? Center(child: Text("No Data"))
        : Center(child: ColorLoader());
  }
}
