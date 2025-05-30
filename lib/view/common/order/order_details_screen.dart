import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:provider/provider.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../core/provider/cart_provider.dart';
import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/customColorLoader.dart';
import '../../../core/utility/custom_appbar.dart';

class OrderDetailsPage extends StatefulWidget {
  final Map args;

  const OrderDetailsPage({super.key, required this.args});

  @override
  OrderDetailsPageScreenState createState() => OrderDetailsPageScreenState();
}

class OrderDetailsPageScreenState extends State<OrderDetailsPage> {
  String logged = "";

  @override
  void initState() {
    super.initState();
    _loadHomeData(isReload: true);
  }

  _loadHomeData({required bool isReload}) {
    logged = SharedPref.getString(CustomStrings().token);
    context.read<CartProvider>().orderDetailsCall(widget.args["id"]);
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
          title: "Order Details",
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          color: ProjectColors().primaryColor,
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ProjectColors().white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    spacing: 15,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Order Info",
                            style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: ProjectColors().blue3,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            textAlign: TextAlign.start,
                          ),
                          Spacer(),
                          Text(
                            context
                                    .watch<CartProvider>()
                                    .orderDetailsResponse
                                    ?.data
                                    ?.order
                                    ?.invoiceNo ??
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
                        ],
                      ),
                      Card(
                        color: ProjectColors().white,
                        margin: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery Information",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ProjectColors().blue3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                    color: Color(0xFF808A9A),
                                  ),
                                  Text(
                                    context
                                            .watch<CartProvider>()
                                            .orderDetailsResponse
                                            ?.data
                                            ?.order
                                            ?.shippingInfo
                                            ?.address ??
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
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    context
                                                .watch<CartProvider>()
                                                .orderDetailsResponse
                                                ?.data
                                                ?.order
                                                ?.customer
                                                ?.fullName ==
                                            "Customer"
                                        ? Icons.home_outlined
                                        : Icons.person_outline_sharp,
                                    size: 15,
                                    color: Color(0xFF808A9A),
                                  ),
                                  Text(
                                    context
                                            .watch<CartProvider>()
                                            .orderDetailsResponse
                                            ?.data
                                            ?.order
                                            ?.customer
                                            ?.fullName ??
                                        "",
                                    style: GoogleFonts.roboto(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: ProjectColors().blue1,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.call_outlined,
                                    size: 15,
                                    color: Color(0xFF808A9A),
                                  ),
                                  Text(
                                    context
                                            .watch<CartProvider>()
                                            .orderDetailsResponse
                                            ?.data
                                            ?.order
                                            ?.shippingInfo
                                            ?.phone ??
                                        "",
                                    style: GoogleFonts.roboto(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: ProjectColors().blue1,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: ProjectColors().primaryColor,
                        margin: EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Text(
                                "Order Time",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ProjectColors().white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                              Spacer(),
                              Text(
                                context
                                        .watch<CartProvider>()
                                        .orderDetailsResponse
                                        ?.data
                                        ?.order
                                        ?.time ??
                                    "0 Days",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: ProjectColors().white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: ProjectColors().white,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order Summery",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: ProjectColors().blue3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 5),
                              productList(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delivery Charge",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
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
                                            .orderDetailsResponse
                                            ?.data
                                            ?.deliveryCost ??
                                        "0",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tax",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
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
                                            .orderDetailsResponse
                                            ?.data
                                            ?.order
                                            ?.taxAmount ??
                                        "0",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
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
                              Container(
                                height: 1,
                                color: ProjectColors().white3,
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: ProjectColors().primaryColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    textAlign: TextAlign.start,
                                  ),

                                  Text(
                                    context
                                            .watch<CartProvider>()
                                            .orderDetailsResponse
                                            ?.data
                                            ?.order
                                            ?.price ??
                                        "0",
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
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
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Order Timeline",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ProjectColors().primaryColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: timeline(),
                      ),
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

  Widget productList() {
    return context.watch<CartProvider>().orderDetailsResponse != null &&
            context
                    .watch<CartProvider>()
                    .orderDetailsResponse
                    ?.data
                    ?.order
                    ?.orderItems !=
                null &&
            context
                .watch<CartProvider>()
                .orderDetailsResponse!
                .data!
                .order!
                .orderItems!
                .isNotEmpty
        ? ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:
              context
                  .watch<CartProvider>()
                  .orderDetailsResponse
                  ?.data
                  ?.order
                  ?.orderItems
                  ?.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  child: CachedNetworkImage(
                    height: 25,
                    width: 25,
                    imageUrl:
                        context
                            .watch<CartProvider>()
                            .orderDetailsResponse
                            ?.data
                            ?.order
                            ?.orderItems
                            ?.elementAt(index)
                            ?.product
                            ?.imageUrl ??
                        "",
                    placeholder:
                        (context, url) => Image.asset(
                          "assets/images/placeholder_image.png",
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                        ),
                    errorWidget:
                        (context, url, error) => Image.asset(
                          "assets/images/placeholder_image.png",
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                        ),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Text(
                    context
                            .watch<CartProvider>()
                            .orderDetailsResponse
                            ?.data
                            ?.order
                            ?.orderItems
                            ?.elementAt(index)
                            ?.productName ??
                        "",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ProjectColors().blue1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    textAlign: TextAlign.start,
                  ),
                ),
                Text(
                  context
                          .watch<CartProvider>()
                          .orderDetailsResponse
                          ?.data
                          ?.order
                          ?.orderItems
                          ?.elementAt(index)
                          ?.price ??
                      "0",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ProjectColors().blue3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
              ],
            );
          },
        )
        : ColorLoader();
  }

  Widget timeline() {
    return context.watch<CartProvider>().orderDetailsResponse != null &&
            context
                    .watch<CartProvider>()
                    .orderDetailsResponse
                    ?.data
                    ?.order
                    ?.orderHistories !=
                null &&
            context
                .watch<CartProvider>()
                .orderDetailsResponse!
                .data!
                .order!
                .orderHistories!
                .isNotEmpty
        ? FixedTimeline.tileBuilder(
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            contentsAlign: ContentsAlign.basic,
            contentsBuilder:
                (context, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      context
                              .watch<CartProvider>()
                              .orderDetailsResponse
                              ?.data
                              ?.order
                              ?.orderHistories
                              ?.elementAt(index)
                              ?.title ??
                          "",
                    ),
                  ),
                ),
            itemCount:
                context
                    .watch<CartProvider>()
                    .orderDetailsResponse
                    ?.data
                    ?.order
                    ?.orderHistories
                    ?.length ??
                0,
            itemExtent: 90,
            connectorBuilder: (context, index, type) {
              return DashedLineConnector(color: ProjectColors().primaryColor);
            },
            indicatorBuilder: (context, index) {
              return DotIndicator(color: ProjectColors().primaryColor, size: 20);
            },
          ),
        )
        : SizedBox();
  }
}
