import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/provider/common_provider.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:grozaar/view/common/product/product_details_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/cart_provider.dart';
import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/customColorLoader.dart';
import '../../../core/utility/custom_appbar.dart';

class ProductListPage extends StatefulWidget {
  final Map args;

  const ProductListPage({super.key, required this.args});

  @override
  ProductListPageScreenState createState() => ProductListPageScreenState();
}

class ProductListPageScreenState extends State<ProductListPage> {
  String logged = "";
  String counter = "1";

  @override
  void initState() {
    super.initState();
    _loadHomeData(isReload: false);
  }

  _loadHomeData({required bool isReload}) {
    logged = SharedPref.getString(CustomStrings().token);
    if (widget.args["type"] == "newProduct") {
      context.read<CommonProvider>().newArrivalProductCall("1", "20");
    } else {
      context.read<CommonProvider>().bestSellProductCall("1", "20");
    }
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
          title:
              widget.args["type"] == "newProduct"
                  ? "New Arrivals"
                  : "Best Selling",
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
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: ProjectColors().white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: LimitedBox(
                maxHeight: MediaQuery.of(context).size.height / 0.2,
                child: productList(),
              ),
            ),
          ),
        ),
      ),
    );
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
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(bottom: 90),
          controller: ScrollController(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.6,
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => ProductDetailsPage(
                          args: {
                            "id":
                                context
                                    .read<CommonProvider>()
                                    .productResponse
                                    ?.data
                                    ?.data?[index]
                                    ?.id ??
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
                    height: 110,
                    width: 110,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
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

                        context
                                .watch<CommonProvider>()
                                .productResponse!
                                .data!
                                .data![index]!
                                .promotionText!
                                .isNotEmpty
                            ? Align(
                              alignment: Alignment.topRight,
                              child: Card(
                                color: ProjectColors().white2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsGeometry.fromLTRB(
                                    10,
                                    5,
                                    10,
                                    5,
                                  ),
                                  child: Text(
                                    context
                                            .watch<CommonProvider>()
                                            .productResponse
                                            ?.data
                                            ?.data?[index]
                                            ?.promotionText ??
                                        "",
                                    style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: ProjectColors().primaryColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                            : SizedBox(),
                      ],
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
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                context
                                        .watch<CommonProvider>()
                                        .productResponse
                                        ?.data
                                        ?.data?[index]
                                        ?.subTotal ??
                                    "0",
                                style: GoogleFonts.roboto(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: ProjectColors().blue3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                softWrap: true,
                              ),
                              SizedBox(width: 2),
                              Flexible(
                                child: Text(
                                  context
                                          .watch<CommonProvider>()
                                          .productResponse
                                          ?.data
                                          ?.data?[index]
                                          ?.price ??
                                      "0",
                                  style: GoogleFonts.roboto(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: ProjectColors().blue1,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
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
                              padding: WidgetStateProperty.all(
                                EdgeInsets.all(5),
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
                                    .addToCart(
                                      context
                                              .read<CommonProvider>()
                                              .productResponse
                                              ?.data
                                              ?.data?[index]
                                              ?.id ??
                                          "0",
                                      "1",
                                    )
                                    .then((value) {
                                      if (value == 200) {}
                                    });
                              }
                            },
                            child: Text(
                              "ADD",
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: ProjectColors().white,
                              ),
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

  Future<void> _handleRefresh() async {
    _loadHomeData(isReload: true);
  }
}
