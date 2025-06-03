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
  const CategoryPage({super.key});

  @override
  CategoryPageScreenState createState() => CategoryPageScreenState();
}

class CategoryPageScreenState extends State<CategoryPage> {
  String logged = "";

  @override
  void initState() {
    super.initState();
    _loadHomeData(isReload: false);
  }

  _loadHomeData({required bool isReload}) {
    logged = SharedPref.getString(CustomStrings().token);
    context.read<CommonProvider>().categoryCall();
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
          title: CustomStrings().categories,
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
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ProjectColors().white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            child: categoryList(),
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
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
