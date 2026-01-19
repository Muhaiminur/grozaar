import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/provider/common_provider.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:provider/provider.dart';

import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/custom_appbar.dart';
import 'category_product_screen.dart';

class CategoryPage extends StatefulWidget {
  bool? hideBack;

  CategoryPage({super.key, this.hideBack});

  @override
  CategoryPageScreenState createState() => CategoryPageScreenState();
}

class CategoryPageScreenState extends State<CategoryPage> {
  String logged = "";
  final controller = ScrollController();
  int page = 1;

  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadHomeData(isReload: false);
    });
  }

  _loadHomeData({required bool isReload}) {
    logged = SharedPref.getString(CustomStrings().token);
    page = 1;
    context.read<CommonProvider>().categoryCall(page.toString(), "20");
    controller.addListener(() {
      if (controller.position.pixels >=
              controller.position.maxScrollExtent - 100 &&
          !isLoadingMore) {
        final next =
            context.read<CommonProvider>().categoryResponse?.data?.links?.next;
        if (next != null && next.isNotEmpty) {
          isLoadingMore = true;
          context
              .read<CommonProvider>()
              .categoryCall((++page).toString(), "20")
              .then((_) => isLoadingMore = false);
        }
      }
    });
    /*controller.addListener(() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent) {
        if (context
                    .read<CommonProvider>()
                    .categoryResponse!
                    .data!
                    .links!
                    .next !=
                null &&
            context
                .read<CommonProvider>()
                .categoryResponse!
                .data!
                .links!
                .next!
                .isNotEmpty) {
          context.read<CommonProvider>().categoryCall(
            (++page).toString(),
            "20",
          );
        }
      }
    });*/
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors().white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight), // Set
        child: CustomAppBar(
          title: CustomStrings().categories,
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
            child: Column(children: [Expanded(child: categoryList())]),
          ),
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    _loadHomeData(isReload: true);
  }

  Widget categoryList() {
    return GridView.builder(
      controller: controller,
      padding: EdgeInsets.only(bottom: 70),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.75,
        crossAxisSpacing: 4,
        mainAxisSpacing: 10,
      ),
      itemCount:
          context.watch<CommonProvider>().categoryResponse?.data?.data?.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => CategoryProductPage(
                      args: {
                        "id":
                            context
                                .read<CommonProvider>()
                                .categoryResponse
                                ?.data
                                ?.data?[index]
                                ?.id ??
                            "",
                        "name":
                            context
                                .read<CommonProvider>()
                                .categoryResponse
                                ?.data
                                ?.data?[index]
                                ?.name ??
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
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: CachedNetworkImage(
                  height: 75,
                  width: 75,
                  imageUrl:
                      context
                          .watch<CommonProvider>()
                          .categoryResponse
                          ?.data
                          ?.data?[index]
                          ?.imageUrl ??
                      "",
                  placeholder:
                      (context, url) => Image.asset(
                        "assets/images/placeholder_image.png",
                        height: 75,
                        width: 75,
                        fit: BoxFit.cover,
                        scale: 10,
                      ),
                  errorWidget:
                      (context, url, error) => Image.asset(
                        "assets/images/placeholder_image.png",
                        height: 75,
                        width: 75,
                        fit: BoxFit.cover,
                        scale: 10,
                      ),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Text(
                  context
                          .watch<CommonProvider>()
                          .categoryResponse
                          ?.data
                          ?.data?[index]
                          ?.name ??
                      "",
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ProjectColors().blue3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
