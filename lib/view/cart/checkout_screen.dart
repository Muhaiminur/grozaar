import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:grozaar/view/common/homepage/main_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/custom_appbar.dart';
import '../../core/provider/auth_provider.dart';
import '../../core/provider/cart_provider.dart';
import '../../core/singleton/logger.dart';
import '../../core/utility/customColorLoader.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  CheckoutPageScreenState createState() => CheckoutPageScreenState();
}

class CheckoutPageScreenState extends State<CheckoutPage> {
  String logged = "";
  bool address = true;
  bool email = true;
  bool phone = true;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadHomeData(isReload: false);
  }

  _loadHomeData({required bool isReload}) {
    logged = SharedPref.getString(CustomStrings().token);
    context.read<AuthProvider>().userDetailsCall().then((value) {
      emailController.text = value.email ?? "";
      phoneController.text = value.phone ?? "";
      //addressController.text = value. ?? "";
      context.read<CartProvider>().showCart(true);
    });
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
          title: CustomStrings().checkout,
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
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Shipping Address",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ProjectColors().blue3,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            address = false;
                          });
                        },
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 18,
                          color: Color(0xFF30DBF2),
                        ),
                      ),
                    ],
                  ),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          readOnly: address,
                          style: GoogleFonts.roboto(
                            color: ProjectColors().blue1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          controller: addressController,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.poppins(
                              color: ProjectColors().primaryColor.withValues(
                                alpha: 90,
                              ),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.fromLTRB(
                              20.0,
                              15.0,
                              20.0,
                              15.0,
                            ),
                            hintText: "Enter Your Address",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            prefixIcon: IconButton(
                              icon: SvgPicture.asset(
                                "assets/images/ic_location.svg",
                                width: 40,
                                height: 40,
                              ),
                              onPressed: () {
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Contact Information",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ProjectColors().blue3,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          readOnly: email,
                          textAlignVertical: TextAlignVertical.center,
                          maxLines: 1,
                          style: GoogleFonts.roboto(
                            color: ProjectColors().blue1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          controller: emailController,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return CustomStrings().required;
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.poppins(
                              color: ProjectColors().primaryColor.withValues(
                                alpha: 90,
                              ),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.fromLTRB(
                              20.0,
                              15.0,
                              20.0,
                              15.0,
                            ),
                            hintText: "Enter Your Email Address",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            prefixIcon: SvgPicture.asset(
                              "assets/images/ic_email.svg",
                              width: 40,
                              height: 40,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  email = false;
                                });
                              },
                              icon: Icon(
                                Icons.edit_outlined,
                                size: 18,
                                color: Color(0xFF30DBF2),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          readOnly: phone,
                          maxLines: 1,
                          textAlignVertical: TextAlignVertical.center,
                          style: GoogleFonts.roboto(
                            color: ProjectColors().blue1,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          controller: phoneController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.poppins(
                              color: ProjectColors().primaryColor.withValues(
                                alpha: 90,
                              ),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.fromLTRB(
                              20.0,
                              15.0,
                              20.0,
                              15.0,
                            ),
                            hintText: "Enter Your Contact Number",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            prefixIcon: SvgPicture.asset(
                              "assets/images/ic_phone.svg",
                              width: 40,
                              height: 40,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  phone = false;
                                });
                              },
                              icon: Icon(
                                Icons.edit_outlined,
                                size: 18,
                                color: Color(0xFF30DBF2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Card(
                    color: ProjectColors().white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "Order Summery",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ProjectColors().blue3,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 5),
                          cartList(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        .cartResponse
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        .cartResponse
                                        ?.totalTaxPrice ??
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
                          Container(height: 1, color: ProjectColors().white3),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        .cartResponse
                                        ?.total ??
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
                      if (_formKey.currentState!.validate()) {
                        Log().hideKeyBoard();
                        context
                            .read<CartProvider>()
                            .checkOutCall(
                              addressController.text,
                              emailController.text.toString(),
                              phoneController.text.toString(),
                            )
                            .then((value) {
                              if (value == 200) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => MainPage(),
                                  ),
                                );
                              }
                            });
                      }
                    },
                    child: Text(
                      "Order Confirm",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ProjectColors().white,
                      ),
                    ),
                  ),
                  SizedBox(height: 190),
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
          itemCount: context.watch<CartProvider>().cartResponse?.items?.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      fontWeight: FontWeight.w400,
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
                          .cartResponse
                          ?.items
                          ?.elementAt(index)
                          ?.totalPrice ??
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
}
