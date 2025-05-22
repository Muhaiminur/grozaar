import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/cart_provider.dart';
import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/colors.dart';
import '../../../core/utility/customStrings.dart';
import '../../../core/utility/routes.dart';

class ProductView extends StatefulWidget {
  final String id;
  final String imageUrl;
  final String name;
  final String price;

  const ProductView({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  String logged = "";

  @override
  void initState() {
    super.initState();
    logged = SharedPref.getString(CustomStrings().token);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          productDetailsPage,
          arguments: {"id": widget.id},
        );
      },
      child: Card(
        color: ProjectColors().white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: ProjectColors().white),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: EdgeInsets.all(5),
        child: Padding(
          padding: EdgeInsets.all(0),
          child: SizedBox(
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: CachedNetworkImage(
                    width: 140,
                    height: 140,
                    imageUrl: widget.imageUrl,
                    placeholder:
                        (context, url) => Image.asset(
                          "assets/images/placeholder_image.png",
                          height: 140,
                          width: 140,
                        ),
                    errorWidget:
                        (context, url, error) => Image.asset(
                          "assets/images/placeholder_image.png",
                          height: 140,
                          width: 140,
                        ),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  widget.name,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ProjectColors().blue3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.price,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ProjectColors().blue3,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    ElevatedButton(
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
                        padding: WidgetStateProperty.all(EdgeInsets.all(5)),
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
                              .addToCart(widget.id, "1")
                              .then((value) {
                                if (value == 200) {

                                }
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
