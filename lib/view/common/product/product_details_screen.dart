import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/provider/common_provider.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/cart_provider.dart';
import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/custom_appbar.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map args;

  const ProductDetailsPage({super.key, required this.args});

  @override
  ProductDetailsPageScreenState createState() =>
      ProductDetailsPageScreenState();
}

class ProductDetailsPageScreenState extends State<ProductDetailsPage> {
  String logged = "";
  String counter = "1";

  @override
  void initState() {
    super.initState();
    _loadHomeData(isReload: false);
  }

  _loadHomeData({required bool isReload}) {
    logged = SharedPref.getString(CustomStrings().token);
    context.read<CommonProvider>().productDetailsCall(widget.args["id"]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight), // Set
        child: CustomAppBar(
          title: CustomStrings().productDetails,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        height: 220,
                        imageUrl:
                            context
                                .watch<CommonProvider>()
                                .productDetailsResponse
                                ?.data
                                ?.product
                                ?.imageUrl ??
                            "",
                        placeholder:
                            (context, url) => Image.asset(
                              "assets/images/placeholder_image.png",
                              height: 220,
                              fit: BoxFit.cover,
                            ),
                        errorWidget:
                            (context, url, error) => Image.asset(
                              "assets/images/placeholder_image.png",
                              height: 220,
                              fit: BoxFit.cover,
                            ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      context
                              .watch<CommonProvider>()
                              .productDetailsResponse
                              ?.data
                              ?.product
                              ?.name ??
                          "",
                      style: GoogleFonts.roboto(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: ProjectColors().blue3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: ProjectColors().yellow,
                          size: 14,
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            context
                                    .watch<CommonProvider>()
                                    .productDetailsResponse
                                    ?.data
                                    ?.product
                                    ?.rating
                                    ?.averageRating ??
                                "0",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
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
                            "(${context.watch<CommonProvider>().productDetailsResponse?.data?.product?.rating?.totalReviewCount ?? "0"}+)",
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            context
                                    .watch<CommonProvider>()
                                    .productDetailsResponse
                                    ?.data
                                    ?.product
                                    ?.price ??
                                "0",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: ProjectColors().blue2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(width: 2),
                        Flexible(
                          child: Text(
                            "/${context.watch<CommonProvider>().productDetailsResponse?.data?.product?.productUnit?.name ?? ""}",
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ProjectColors().blue2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Spacer(flex: 2),
                        IconButton(
                          onPressed: () {
                            if (int.parse(counter) > 1 &&
                                int.parse(counter) <
                                    int.parse(
                                      context
                                              .read<CommonProvider>()
                                              .productDetailsResponse
                                              ?.data
                                              ?.product
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
                          iconSize: 24,
                        ),
                        Text(
                          counter,
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: ProjectColors().blue3,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          context
                                  .watch<CommonProvider>()
                                  .productDetailsResponse
                                  ?.data
                                  ?.product
                                  ?.productUnit
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
                          textAlign: TextAlign.center,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (int.parse(counter) >= 1 &&
                                  int.parse(counter) <
                                      int.parse(
                                        context
                                                .read<CommonProvider>()
                                                .productDetailsResponse
                                                ?.data
                                                ?.product
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
                          iconSize: 24,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      "Description",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ProjectColors().blue3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      context
                              .watch<CommonProvider>()
                              .productDetailsResponse
                              ?.data
                              ?.product
                              ?.notes ??
                          "",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ProjectColors().blue1,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Text(
                      "Related Items",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ProjectColors().blue3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Total Price",
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
                            SizedBox(height: 5),
                            Text(
                              (int.parse(counter) *
                                      double.parse(
                                        context
                                                .watch<CommonProvider>()
                                                .productDetailsResponse
                                                ?.data
                                                ?.product
                                                ?.price ??
                                            "1",
                                      ))
                                  .toString(),
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: ProjectColors().primaryColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
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
                              EdgeInsets.fromLTRB(25, 10, 25, 10),
                            ),
                            textStyle: WidgetStateProperty.all(
                              TextStyle(
                                fontSize: 12,
                                color: ProjectColors().white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (logged.isNotEmpty) {
                              context
                                  .read<CartProvider>()
                                  .addToCart(widget.args["id"], "1")
                                  .then((value) {
                                    if (value == 200) {}
                                  });
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: ProjectColors().white,
                                size: 15,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Add To Cart",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: ProjectColors().white,
                                ),
                              ),
                            ],
                          ),
                        ),
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
}
