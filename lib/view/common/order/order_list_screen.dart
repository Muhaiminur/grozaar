import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:grozaar/core/utility/routes.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/cart_provider.dart';
import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/customColorLoader.dart';
import '../../../core/utility/custom_appbar.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  OrderListPageScreenState createState() => OrderListPageScreenState();
}

class OrderListPageScreenState extends State<OrderListPage> {
  String logged = "";
  bool ongoing = true;

  @override
  void initState() {
    super.initState();
    _loadHomeData(isReload: true);
  }

  _loadHomeData({required bool isReload}) {
    logged = SharedPref.getString(CustomStrings().token);
    context.read<CartProvider>().ongoingOrderCall();
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
          title: "Order History",
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
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffF3F1FB),
                          borderRadius: BorderRadius.circular(23),
                          shape: BoxShape.rectangle,
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: WidgetStatePropertyAll(0),
                                minimumSize: WidgetStateProperty.all(Size.zero),
                                // Set
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all(
                                  ongoing
                                      ? ProjectColors().primaryColor
                                      : Color(0xffF3F1FB),
                                ),
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.fromLTRB(34, 5, 34, 5),
                                ),
                                textStyle: WidgetStateProperty.all(
                                  TextStyle(
                                    fontSize: 15,
                                    color:
                                        ongoing
                                            ? ProjectColors().white
                                            : ProjectColors().blue1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                context.read<CartProvider>().ongoingOrderCall();
                                setState(() {
                                  ongoing = true;
                                });
                              },
                              child: Text(
                                "Ongoing",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      ongoing
                                          ? ProjectColors().white
                                          : ProjectColors().blue1,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: WidgetStatePropertyAll(0),
                                minimumSize: WidgetStateProperty.all(Size.zero),
                                // Set
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all(
                                  !ongoing
                                      ? ProjectColors().primaryColor
                                      : Color(0xffF3F1FB),
                                ),
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.fromLTRB(34, 5, 34, 5),
                                ),
                                textStyle: WidgetStateProperty.all(
                                  TextStyle(
                                    fontSize: 15,
                                    color:
                                        !ongoing
                                            ? ProjectColors().white
                                            : ProjectColors().blue1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .completeOrderCall();
                                setState(() {
                                  ongoing = false;
                                });
                              },
                              child: Text(
                                "Completed",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      !ongoing
                                          ? ProjectColors().white
                                          : ProjectColors().blue1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ongoing ? onGoingView() : completeView(),
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

  Widget onGoingView() {
    return context.watch<CartProvider>().orderHistoryResponse != null &&
            context.watch<CartProvider>().orderHistoryResponse?.data?.data !=
                null &&
            context
                .watch<CartProvider>()
                .orderHistoryResponse!
                .data!
                .data!
                .isNotEmpty
        ? ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:
              context
                  .watch<CartProvider>()
                  .orderHistoryResponse
                  ?.data
                  ?.data
                  ?.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: ProjectColors().white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0x0a0f291a), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 5,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            context
                                    .watch<CartProvider>()
                                    .orderHistoryResponse
                                    ?.data
                                    ?.data
                                    ?.elementAt(index)
                                    ?.invoiceNo ??
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
                        Text(
                          context
                                  .watch<CartProvider>()
                                  .orderHistoryResponse
                                  ?.data
                                  ?.data
                                  ?.elementAt(index)
                                  ?.time ??
                              "",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context
                                .watch<CartProvider>()
                                .orderHistoryResponse
                                ?.data
                                ?.data
                                ?.elementAt(index)
                                ?.price ??
                            "",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ProjectColors().blue1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                ProjectColors().primaryColor,
                              ),
                              padding: WidgetStateProperty.all(
                                EdgeInsets.only(left: 25, right: 25),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              context
                                      .watch<CartProvider>()
                                      .orderHistoryResponse
                                      ?.data
                                      ?.data
                                      ?.elementAt(index)
                                      ?.status ??
                                  "",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: ProjectColors().white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                ProjectColors().white,
                              ),
                              padding: WidgetStateProperty.all(
                                EdgeInsets.only(left: 25, right: 25),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23),
                                  side: BorderSide(
                                    width: 1,
                                    color: Color(0xFFC3C8D0),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                orderDetailsPage,
                                arguments: {
                                  "id":
                                      context
                                          .read<CartProvider>()
                                          .orderHistoryResponse
                                          ?.data
                                          ?.data
                                          ?.elementAt(index)
                                          ?.id ??
                                      "0",
                                },
                              );
                            },
                            child: Text(
                              "Details",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: ProjectColors().blue3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
        : ColorLoader();
  }

  Widget completeView() {
    return context.watch<CartProvider>().orderHistoryResponse != null &&
            context.watch<CartProvider>().orderHistoryResponse?.data?.data !=
                null &&
            context
                .watch<CartProvider>()
                .orderHistoryResponse!
                .data!
                .data!
                .isNotEmpty
        ? ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:
              context
                  .watch<CartProvider>()
                  .orderHistoryResponse
                  ?.data
                  ?.data
                  ?.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: ProjectColors().white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0x0a0f291a), width: 1),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 5,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            context
                                    .watch<CartProvider>()
                                    .orderHistoryResponse
                                    ?.data
                                    ?.data
                                    ?.elementAt(index)
                                    ?.invoiceNo ??
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
                        Text(
                          context
                                  .watch<CartProvider>()
                                  .orderHistoryResponse
                                  ?.data
                                  ?.data
                                  ?.elementAt(index)
                                  ?.time ??
                              "",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context
                                .watch<CartProvider>()
                                .orderHistoryResponse
                                ?.data
                                ?.data
                                ?.elementAt(index)
                                ?.price ??
                            "",
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ProjectColors().blue1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                ProjectColors().green1,
                              ),
                              padding: WidgetStateProperty.all(
                                EdgeInsets.only(left: 25, right: 25),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              context
                                      .watch<CartProvider>()
                                      .orderHistoryResponse
                                      ?.data
                                      ?.data
                                      ?.elementAt(index)
                                      ?.status ??
                                  "",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: ProjectColors().white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                ProjectColors().white,
                              ),
                              padding: WidgetStateProperty.all(
                                EdgeInsets.only(left: 25, right: 25),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(23),
                                  side: BorderSide(
                                    width: 1,
                                    color: Color(0xFFC3C8D0),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                orderDetailsPage,
                                arguments: {
                                  "id":
                                      context
                                          .watch<CartProvider>()
                                          .orderHistoryResponse
                                          ?.data
                                          ?.data
                                          ?.elementAt(index)
                                          ?.id ??
                                      "0",
                                },
                              );
                            },
                            child: Text(
                              "Details",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: ProjectColors().blue3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
        : ColorLoader();
  }
}
