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
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
            width: double.infinity,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/ic_welcome.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Doorstep delivery of \n your groceries",
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: ProjectColors().blue3,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "Say goodbye to long grocery lines and last-minute store runs! With Grozaar Grocery we bring fresh, high-quality groceries straight to your doorstep, saving you time and effort.",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ProjectColors().blue1,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
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
