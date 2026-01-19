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

class CategoryProductPage extends StatefulWidget {
  final Map args;

  const CategoryProductPage({super.key, required this.args});

  @override
  CategoryProductPageScreenState createState() =>
      CategoryProductPageScreenState();
}

class CategoryProductPageScreenState extends State<CategoryProductPage> {
  String logged = "";
  String cat = "";

  final ScrollController _productScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    cat = widget.args["name"];
    _loadHomeData(isReload: false);
  }

  _loadHomeData({required bool isReload}) {
    context.read<CommonProvider>().setProductResponse = null;
    logged = SharedPref.getString(CustomStrings().token);
    context.read<CommonProvider>().categoryProductCall(
      widget.args["id"] ?? "",
      "1",
      "50",
      "",
    );
    context.read<CommonProvider>().subCategoryCall(widget.args["id"]);
    /*context.read<CommonProvider>().subCategoryCall(widget.args["id"]).then((
      value,
    ) {
      if (context.read<CommonProvider>().subCategoryResponse != null &&
          context.read<CommonProvider>().subCategoryResponse?.data?.data !=
              null &&
          context
              .read<CommonProvider>()
              .subCategoryResponse!
              .data!
              .data!
              .isNotEmpty) {
        context.read<CommonProvider>().categoryProductCall(
          context
                  .read<CommonProvider>()
                  .subCategoryResponse
                  ?.data
                  ?.data
                  ?.first
                  ?.id ??
              "",
          "1",
          "50",
          "",
        );
      }
    });*/
  }

  @override
  void dispose() {
    _productScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight), // Set
        child: CustomAppBar(
          title: cat,
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
        child: Container(
          color: ProjectColors().primaryColor,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 60),
            decoration: BoxDecoration(
              color: ProjectColors().white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 80, child: categoryList()),
                Container(
                  color: ProjectColors().blue1.withAlpha(50),
                  height: double.infinity,
                  width: 2,
                ),
                SizedBox(width: 5),
                Expanded(child: productList()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    _loadHomeData(isReload: true);
  }

  Widget categoryList() {
    return context.watch<CommonProvider>().subCategoryResponse != null &&
            context.watch<CommonProvider>().subCategoryResponse?.data?.data !=
                null &&
            context
                .watch<CommonProvider>()
                .subCategoryResponse!
                .data!
                .data!
                .isNotEmpty
        ? RawScrollbar(
          trackVisibility: true,
          thumbVisibility: true,
          controller: ScrollController(),
          thumbColor: ProjectColors().primaryColor,
          child: ListView.builder(
            shrinkWrap: true,
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            itemCount:
                context
                    .watch<CommonProvider>()
                    .subCategoryResponse
                    ?.data
                    ?.data
                    ?.length,
            itemBuilder: (BuildContext context, int position) {
              return GestureDetector(
                onTap: () {
                  _scrollToTop();
                  context.read<CommonProvider>().categoryProductCall(
                    context
                            .read<CommonProvider>()
                            .subCategoryResponse
                            ?.data
                            ?.data?[position]
                            ?.id ??
                        widget.args["id"],
                    "1",
                    "50",
                    "",
                  );
                  setState(() {
                    cat =
                        context
                            .read<CommonProvider>()
                            .subCategoryResponse
                            ?.data
                            ?.data?[position]
                            ?.name ??
                        "";
                  });
                },
                child: LimitedBox(
                  maxHeight: 120,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        child: CachedNetworkImage(
                          height: 60,
                          width: 60,
                          imageUrl:
                              context
                                  .watch<CommonProvider>()
                                  .subCategoryResponse
                                  ?.data
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
                              (context, imageProvider) =>
                                  CircleAvatar(backgroundImage: imageProvider),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text(
                            context
                                    .watch<CommonProvider>()
                                    .subCategoryResponse
                                    ?.data
                                    ?.data?[position]
                                    ?.name ??
                                "",
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight:
                                  cat ==
                                          context
                                              .read<CommonProvider>()
                                              .subCategoryResponse
                                              ?.data
                                              ?.data?[position]
                                              ?.name
                                      ? FontWeight.w900
                                      : FontWeight.w500,
                              color: ProjectColors().blue3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
        : context.watch<CommonProvider>().subCategoryResponse?.data?.data !=
                null &&
            context
                .watch<CommonProvider>()
                .subCategoryResponse!
                .data!
                .data!
                .isEmpty
        ? SizedBox()
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
          controller: _productScrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
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
                    width: double.infinity,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          height: 110,
                          width: double.infinity,
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
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                          errorWidget:
                              (context, url, error) => Image.asset(
                                "assets/images/placeholder_image.png",
                                height: 110,
                                width: double.infinity,
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
                        context
                                .watch<CommonProvider>()
                                .productResponse!
                                .data!
                                .data![index]!
                                .totalStockQuantity!
                                .isNotEmpty
                            ? Align(
                              alignment: Alignment.topLeft,
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
                                    "Stock Out"
                                    /*context
                                            .watch<CommonProvider>()
                                            .productResponse
                                            ?.data
                                            ?.data?[index]
                                            ?.totalStockQuantity ??
                                        ""*/,
                                    style: GoogleFonts.roboto(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: ProjectColors().red1,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 0,
                        color: ProjectColors().white2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: EdgeInsetsGeometry.fromLTRB(5, 5, 5, 5),
                          child: Text(
                            "${context.watch<CommonProvider>().productResponse?.data?.data?[index]?.productMeta?.unitValue ?? "0"} "
                            "${context.watch<CommonProvider>().productResponse?.data?.data?[index]?.productUnit?.symbol ?? "0"}",
                            style: GoogleFonts.roboto(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: ProjectColors().primaryColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          color: ProjectColors().white2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.fromLTRB(5, 5, 10, 5),
                            child: Text(
                              context
                                      .watch<CommonProvider>()
                                      .productResponse
                                      ?.data
                                      ?.data?[index]
                                      ?.brand
                                      ?.name ??
                                  "",
                              style: GoogleFonts.roboto(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: ProjectColors().primaryColor,
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  /*Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context
                                  .watch<CommonProvider>()
                                  .productResponse
                                  ?.data
                                  ?.data?[index]
                                  ?.createdAt ??
                              "",
                          style: GoogleFonts.roboto(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: ProjectColors().blue1,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                        */
                  /*Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
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
                        ),*/
                  /*
                      ],
                    ),
                  ),*/
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
                              /*Flexible(
                                child: Text(
                                  context
                                          .watch<CommonProvider>()
                                          .productResponse
                                          ?.data
                                          ?.data?[index]
                                          ?.oldPrice ??
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
                              ),*/
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
                              if ( /*logged.isNotEmpty*/ true) {
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
                (context.watch<CommonProvider>().productResponse?.data?.data !=
                        null &&
                    context
                        .watch<CommonProvider>()
                        .productResponse!
                        .data!
                        .data!
                        .isEmpty) ||
            context.watch<CommonProvider>().productResponse?.data?.data == null
        ? Center(child: Text("No Data"))
        : Center(child: ColorLoader());
  }

  void _scrollToTop() {
    _productScrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
