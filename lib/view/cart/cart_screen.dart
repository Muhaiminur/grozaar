import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/provider/cart_provider.dart';
import 'package:grozaar/core/singleton/logger.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:provider/provider.dart';

import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/customColorLoader.dart';
import '../../../core/utility/custom_appbar.dart';
import 'checkout_screen.dart';

class CartPage extends StatefulWidget {
  bool? hideBack;

  CartPage({super.key, this.hideBack});

  @override
  CartPageScreenState createState() => CartPageScreenState();
}

class CartPageScreenState extends State<CartPage> {
  String logged = "";

  @override
  void initState() {
    super.initState();
    _loadHomeData(isReload: false);
  }

  _loadHomeData({required bool isReload}) {
    logged = SharedPref.getString(CustomStrings().token);
    context.read<CartProvider>().showCart();
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
          title: CustomStrings().cart,
          onTap: () {
            Navigator.pop(context);
          },
          hideBack: widget.hideBack ?? false,
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
              padding: EdgeInsets.fromLTRB(10, 10, 10, 50),
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
                        context
                                .watch<CartProvider>()
                                .cartResponse
                                ?.subTotalPrice ??
                            "0",
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
                        context
                                .watch<CartProvider>()
                                .cartResponse
                                ?.deliveryCost ??
                            "0",
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
                        context
                                .watch<CartProvider>()
                                .cartResponse
                                ?.totalTaxPrice ??
                            "0",
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
                        context.watch<CartProvider>().cartResponse?.total ??
                            "0",
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
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CheckoutPage()),
                      );
                    },
                    child: Text(
                      "Checkout",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ProjectColors().white,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
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
    return context.watch<CartProvider>().cartResponse != null &&
            context.watch<CartProvider>().cartResponse?.items != null &&
            context.watch<CartProvider>().cartResponse!.items!.isNotEmpty
        ? ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: context.watch<CartProvider>().cartResponse?.items?.length,
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
                                .watch<CartProvider>()
                                .cartResponse
                                ?.items
                                ?.elementAt(index)
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
                                          .watch<CartProvider>()
                                          .cartResponse
                                          ?.items
                                          ?.elementAt(index)
                                          ?.productName ??
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
                                onPressed: () {
                                  context
                                      .read<CartProvider>()
                                      .deleteToCart(
                                        context
                                                .read<CartProvider>()
                                                .cartResponse
                                                ?.items
                                                ?.elementAt(index)
                                                ?.cartId ??
                                            "0",
                                      )
                                      .then((value) {
                                        context.read<CartProvider>().showCart();
                                      });
                                },
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
                                    .watch<CartProvider>()
                                    .cartResponse
                                    ?.items
                                    ?.elementAt(index)
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
                                        .watch<CartProvider>()
                                        .cartResponse
                                        ?.items
                                        ?.elementAt(index)
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
                                "/${context.watch<CartProvider>().cartResponse?.items?.elementAt(index)?.productUnit?.name ?? ""}",
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
                                  if (int.parse(
                                            context
                                                    .read<CartProvider>()
                                                    .cartResponse
                                                    ?.items
                                                    ?.elementAt(index)
                                                    ?.quantity ??
                                                "0",
                                          ) >
                                          1 &&
                                      int.parse(
                                            context
                                                    .read<CartProvider>()
                                                    .cartResponse
                                                    ?.items
                                                    ?.elementAt(index)
                                                    ?.quantity ??
                                                "0",
                                          ) <
                                          int.parse(
                                            context
                                                    .read<CartProvider>()
                                                    .cartResponse
                                                    ?.items
                                                    ?.elementAt(index)
                                                    ?.totalStockQuantity ??
                                                "0",
                                          )) {
                                    context
                                        .read<CartProvider>()
                                        .removeToCart(
                                          context
                                                  .read<CartProvider>()
                                                  .cartResponse
                                                  ?.items
                                                  ?.elementAt(index)
                                                  ?.productId ??
                                              "0",
                                          "1",
                                        )
                                        .then((value) {
                                          if (value == 200) {
                                            context
                                                .read<CartProvider>()
                                                .showCart();
                                          }
                                        });
                                  }
                                  setState(() {});
                                },
                                icon: Icon(Icons.remove_circle_outline_sharp),
                                color: ProjectColors().blue1,
                                iconSize: 20,
                              ),
                              Text(
                                int.parse(
                                  context
                                          .watch<CartProvider>()
                                          .cartResponse
                                          ?.items
                                          ?.elementAt(index)
                                          ?.quantity ??
                                      "0",
                                ).toString(),
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
                                        .watch<CartProvider>()
                                        .cartResponse
                                        ?.items
                                        ?.elementAt(index)
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
                                  if (int.parse(
                                            context
                                                    .read<CartProvider>()
                                                    .cartResponse
                                                    ?.items
                                                    ?.elementAt(index)
                                                    ?.quantity ??
                                                "0",
                                          ) >=
                                          1 &&
                                      int.parse(
                                            context
                                                    .read<CartProvider>()
                                                    .cartResponse
                                                    ?.items
                                                    ?.elementAt(index)
                                                    ?.quantity ??
                                                "0",
                                          ) <
                                          int.parse(
                                            context
                                                    .read<CartProvider>()
                                                    .cartResponse
                                                    ?.items
                                                    ?.elementAt(index)
                                                    ?.totalStockQuantity ??
                                                "1",
                                          )) {
                                    context
                                        .read<CartProvider>()
                                        .addToCart(
                                          context
                                                  .read<CartProvider>()
                                                  .cartResponse
                                                  ?.items
                                                  ?.elementAt(index)
                                                  ?.productId ??
                                              "0",
                                          "1",
                                        )
                                        .then((value) {
                                          if (value == 200) {
                                            context
                                                .read<CartProvider>()
                                                .showCart();
                                          }
                                        });
                                  }
                                  Log().printInfo(
                                    "msg${int.parse(context.read<CartProvider>().cartResponse?.items?.elementAt(index)?.quantity ?? "0") + 1}",
                                  );
                                  setState(() {});
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
        : context.watch<CartProvider>().cartResponse != null &&
            context.watch<CartProvider>().cartResponse?.items != null &&
            context.watch<CartProvider>().cartResponse!.items!.isEmpty
        ? Center(
          child: Text(
            "No Item Added",
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: ProjectColors().primaryColor,
            ),
          ),
        )
        : ColorLoader();
  }
}
