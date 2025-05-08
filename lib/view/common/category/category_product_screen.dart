import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/provider/common_provider.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:provider/provider.dart';

import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/customColorLoader.dart';
import '../../../core/utility/custom_appbar.dart';

class CategoryProductPage extends StatefulWidget {
  String pid;

  CategoryProductPage({super.key, required this.pid});

  @override
  CategoryProductPageScreenState createState() =>
      CategoryProductPageScreenState();
}

class CategoryProductPageScreenState extends State<CategoryProductPage> {
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ProjectColors().white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                child: Row(children: [categoryList()]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleRefresh() async {
    _loadHomeData(isReload: true);
  }

  Widget categoryList() {
    return context.watch<CommonProvider>().categoryResponse != null &&
            context.watch<CommonProvider>().categoryResponse?.data?.data !=
                null &&
            context
                .watch<CommonProvider>()
                .categoryResponse!
                .data!
                .data!
                .isNotEmpty
        ? ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:
              context
                  .watch<CommonProvider>()
                  .categoryResponse
                  ?.data
                  ?.data
                  ?.length,
          itemBuilder: (BuildContext context, int position) {
            return GestureDetector(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade200,
                    radius: 28,
                    child: CachedNetworkImage(
                      height: 60,
                      width: 60,
                      imageUrl:
                          context
                              .watch<CommonProvider>()
                              .categoryResponse
                              ?.data
                              ?.data?[position]
                              ?.imageUrl ??
                          "",
                      placeholder:
                          (context, url) => Image.asset(
                            "assets/images/placeholder_image.png",
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                            scale: 10,
                          ),
                      errorWidget:
                          (context, url, error) => Image.asset(
                            "assets/images/placeholder_image.png",
                            height: 60,
                            width: 60,
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
                              ?.data?[position]
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
        )
        : ColorLoader();
  }
}
