import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/cart_provider.dart';
import '../../../core/singleton/shared_pref.dart';
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
                          padding: const EdgeInsets.all(5.0),
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
}
