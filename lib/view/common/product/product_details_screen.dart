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
import '../../../core/utility/routes.dart';

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
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
                        Card(
                          color: ProjectColors().white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: ProjectColors().green1,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                productListPage,
                                arguments: {
                                  "type": "brandProduct",
                                  "brandId":
                                      context
                                          .read<CommonProvider>()
                                          .productDetailsResponse
                                          ?.data
                                          ?.product
                                          ?.brand?.id ??
                                      "0",
                                  "brandName":
                                      context
                                          .read<CommonProvider>()
                                          .productDetailsResponse
                                          ?.data
                                          ?.product
                                          ?.brand?.name ??
                                      "",
                                },
                              );
                            },
                            child: Padding(
                              padding: EdgeInsetsGeometry.fromLTRB(5, 5, 5, 5),
                              child: Text(
                                context
                                        .watch<CommonProvider>()
                                        .productDetailsResponse
                                        ?.data
                                        ?.product
                                        ?.brand
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
                        Text(
                          context
                                  .watch<CommonProvider>()
                                  .productDetailsResponse
                                  ?.data
                                  ?.product
                                  ?.createdAt ??
                              "",
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
                        SizedBox(width: 15),
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
                    child: relatedItems(),
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
                                                (context
                                                            .watch<
                                                              CommonProvider
                                                            >()
                                                            .productDetailsResponse
                                                            ?.data
                                                            ?.product
                                                            ?.price ??
                                                        "1")
                                                    .replaceAll(
                                                      RegExp(r'[^0-9]'),
                                                      '',
                                                    ),
                                              ))
                                          .toString()
                                          .length >
                                      5
                                  ? (int.parse(counter) *
                                          double.parse(
                                            (context
                                                        .watch<CommonProvider>()
                                                        .productDetailsResponse
                                                        ?.data
                                                        ?.product
                                                        ?.price ??
                                                    "1")
                                                .replaceAll(
                                                  RegExp(r'[^0-9]'),
                                                  '',
                                                ),
                                          ))
                                      .toString()
                                      .substring(0, 5)
                                  : (int.parse(counter) *
                                          double.parse(
                                            (context
                                                        .watch<CommonProvider>()
                                                        .productDetailsResponse
                                                        ?.data
                                                        ?.product
                                                        ?.price ??
                                                    "1")
                                                .replaceAll(
                                                  RegExp(r'[^0-9]'),
                                                  '',
                                                ),
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
                            if ( /*logged.isNotEmpty*/ true) {
                              context
                                  .read<CartProvider>()
                                  .addToCart(widget.args["id"], counter)
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

  Widget relatedItems() {
    return context.watch<CommonProvider>().productDetailsResponse != null &&
            context
                .watch<CommonProvider>()
                .productDetailsResponse!
                .data!
                .relatedItems!
                .data!
                .isNotEmpty
        ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
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
            LimitedBox(
              maxHeight: 100,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(5),
                scrollDirection: Axis.horizontal,
                itemCount:
                    context
                        .watch<CommonProvider>()
                        .productDetailsResponse
                        ?.data
                        ?.relatedItems
                        ?.data
                        ?.length,
                itemBuilder: (BuildContext context, int position) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => ProductDetailsPage(
                                args: {
                                  "id":
                                      context
                                          .read<CommonProvider>()
                                          .productDetailsResponse
                                          ?.data
                                          ?.relatedItems
                                          ?.data?[position]
                                          ?.id,
                                },
                              ),
                        ),
                      );
                    },
                    child: Card(
                      color: ProjectColors().white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: ProjectColors().white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      margin: EdgeInsets.all(5),
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 28,
                                child: CachedNetworkImage(
                                  height: 60,
                                  width: 60,
                                  imageUrl:
                                      context
                                          .watch<CommonProvider>()
                                          .productDetailsResponse
                                          ?.data
                                          ?.relatedItems
                                          ?.data?[position]
                                          ?.imageUrl ??
                                      "",
                                  placeholder:
                                      (context, url) => Image.asset(
                                        "assets/images/placeholder_image.png",
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.fill,
                                        scale: 10,
                                      ),
                                  errorWidget:
                                      (context, url, error) => Image.asset(
                                        "assets/images/placeholder_image.png",
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.fill,
                                        scale: 10,
                                      ),
                                  fit: BoxFit.cover,
                                  imageBuilder:
                                      (context, imageProvider) => CircleAvatar(
                                        backgroundImage: imageProvider,
                                      ),
                                ),
                              ),
                              Text(
                                context
                                        .watch<CommonProvider>()
                                        .productDetailsResponse
                                        ?.data
                                        ?.relatedItems
                                        ?.data?[position]
                                        ?.name ??
                                    "",
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ProjectColors().blue2,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        )
        : SizedBox();
  }

  Future<void> _handleRefresh() async {
    _loadHomeData(isReload: true);
  }
}
