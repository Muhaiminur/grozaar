import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/routes.dart';

import '../../core/utility/customStrings.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  WelcomePageScreenState createState() => WelcomePageScreenState();
}

class WelcomePageScreenState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            decoration: BoxDecoration(
              color: ProjectColors().primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(80),
                bottomLeft: Radius.circular(80),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/images/ic_welcome.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
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
              onPressed: () {
                Navigator.pushReplacementNamed(context, mainPage);
              },
              child: Text(
                CustomStrings().getStarted,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: ProjectColors().white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
