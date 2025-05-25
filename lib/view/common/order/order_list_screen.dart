import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';

import '../../../core/singleton/shared_pref.dart';
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
    //context.read<CommonProvider>().categoryCall();
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
                      //ongoing ? restaurentView() : userView(),
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
