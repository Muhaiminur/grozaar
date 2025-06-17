import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/common_provider.dart';
import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/custom_appbar.dart';
import '../../../model/product_response.dart';
import '../product/product_details_screen.dart';

class SearchPage extends StatefulWidget {
  bool? hideBack;

  SearchPage({super.key, this.hideBack});

  @override
  SearchPageScreenState createState() => SearchPageScreenState();
}

class SearchPageScreenState extends State<SearchPage> {
  String logged = "";

  /*final List<String> _allItems = [
    'Apple',
    'Banana',
    'Orange',
    'Grapes',
    'Pineapple',
    'Strawberry',
    'Blueberry',
  ];*/
  List<ProductResponseDataData?> _filteredItems = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadHomeData(isReload: false);
    //_filteredItems = _allItems;
    _searchController.addListener(() {
      filterList();
    });
  }

  void filterList() {
    final query = _searchController.text.toLowerCase();
    context.read<CommonProvider>().searchProductCall(query, "1", "20").then((
      value,
    ) {
      _filteredItems =
          context.read<CommonProvider>().productResponse?.data?.data ?? [];
      setState(() {});
    });
    setState(() {
      /*
      _filteredItems =
          _allItems
              .where((item) => item.toLowerCase().contains(query))
              .toList();*/
    });
  }

  _loadHomeData({required bool isReload}) {
    logged = SharedPref.getString(CustomStrings().token);
    //context.read<CommonProvider>().promotionCall();
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
          title: "Search",
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
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: TextFormField(
                      controller: _searchController,
                      style: GoogleFonts.roboto(
                        color: ProjectColors().blue1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: ProjectColors().white,
                        filled: true,
                        hintStyle: GoogleFonts.roboto(
                          color: ProjectColors().blue1,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(
                          20.0,
                          5.0,
                          20.0,
                          5.0,
                        ),
                        hintText: "Search your daily grocery food",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ProjectColors().primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIconColor: ProjectColors().blue1,
                        prefixIcon: Icon(
                          Icons.search,
                          color: ProjectColors().blue1,
                        ),
                      ),
                    ),
                  ),
                  LimitedBox(
                    maxHeight: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: _filteredItems.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          shape: Border(
                            bottom: BorderSide(
                              color: ProjectColors().primaryColor,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black26,
                            size: 15,
                          ),
                          leading: CachedNetworkImage(
                            height: 60,
                            width: 60,
                            imageUrl: _filteredItems[index]?.imageUrl ?? "",
                            placeholder:
                                (context, url) => Image.asset(
                                  "assets/images/placeholder_image.png",
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                            errorWidget:
                                (context, url, error) => Image.asset(
                                  "assets/images/placeholder_image.png",
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                            fit: BoxFit.cover,
                          ),
                          title: Text(_filteredItems[index]?.name ?? ""),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => ProductDetailsPage(
                                      args: {
                                        "id": _filteredItems[index]?.id ?? "0",
                                      },
                                    ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
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
}
