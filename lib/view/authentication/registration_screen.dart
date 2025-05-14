import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';

import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/custom_appbar.dart';
import '../../core/utility/routes.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  RegistrationPageScreenState createState() => RegistrationPageScreenState();
}

class RegistrationPageScreenState extends State<RegistrationPage> {
  String logged = "";
  bool restaurent = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _userFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final regNameController = TextEditingController();
  final emailController = TextEditingController();
  final regEmailController = TextEditingController();
  final numberController = TextEditingController();
  final regNumberController = TextEditingController();
  final manNumberController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final regPasswordController = TextEditingController();
  bool passwordVisible = true;
  bool regPasswordVisible = true;

  @override
  void initState() {
    super.initState();
  }

  _loadHomeData({required bool isReload}) {
    logged = SharedPref.getString(CustomStrings().token);
    //context.read<CommonProvider>().categoryCall();
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
          title: CustomStrings().register,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          color: ProjectColors().primaryColor,
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ProjectColors().white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    spacing: 15,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Lest Start!",
                        style: GoogleFonts.roboto(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: ProjectColors().primaryColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Create an account or login to explore\n about our app",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ProjectColors().blue1,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffF3F1FB),
                          borderRadius: BorderRadius.circular(23),
                          shape: BoxShape.rectangle,
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                        margin: EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: WidgetStatePropertyAll(0),
                                minimumSize: WidgetStateProperty.all(Size.zero),
                                // Set
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all(
                                  restaurent
                                      ? ProjectColors().primaryColor
                                      : Color(0xffF3F1FB),
                                ),
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.fromLTRB(14, 5, 14, 5),
                                ),
                                textStyle: WidgetStateProperty.all(
                                  TextStyle(
                                    fontSize: 15,
                                    color:
                                        restaurent
                                            ? ProjectColors().white
                                            : ProjectColors().blue1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  restaurent = true;
                                });
                              },
                              child: Text(
                                "Restaurant",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      restaurent
                                          ? ProjectColors().white
                                          : ProjectColors().blue1,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: WidgetStatePropertyAll(0),
                                minimumSize: WidgetStateProperty.all(Size.zero),
                                // Set
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                ),
                                backgroundColor: WidgetStateProperty.all(
                                  !restaurent
                                      ? ProjectColors().primaryColor
                                      : Color(0xffF3F1FB),
                                ),
                                padding: WidgetStateProperty.all(
                                  EdgeInsets.fromLTRB(14, 5, 14, 5),
                                ),
                                textStyle: WidgetStateProperty.all(
                                  TextStyle(
                                    fontSize: 15,
                                    color:
                                        !restaurent
                                            ? ProjectColors().white
                                            : ProjectColors().blue1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  restaurent = false;
                                });
                              },
                              child: Text(
                                "Regular User",
                                style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      !restaurent
                                          ? ProjectColors().white
                                          : ProjectColors().blue1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      restaurent ? restaurentView() : userView(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
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
                            Navigator.pushNamed(context, loginPage);
                          },
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.roboto(
                              fontSize: 16,
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
          ),
        ),
      ),
    );
  }

  Widget restaurentView() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 10,
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Restaurant Name",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ProjectColors().blue1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            style: GoogleFonts.roboto(
              color: ProjectColors().blue1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            controller: nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return CustomStrings().required;
              }
              return null; // Valid input
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              fillColor: ProjectColors().white,
              filled: true,
              hintStyle: GoogleFonts.roboto(
                color: ProjectColors().blue1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: ProjectColors().primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Enter Restaurant Name",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Email Address",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ProjectColors().blue1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            style: GoogleFonts.roboto(
              color: ProjectColors().blue1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return CustomStrings().required;
              } else if (!RegExp(
                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
              ).hasMatch(value)) {
                return CustomStrings().invalidEmail;
              }
              return null; // Valid input
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              fillColor: ProjectColors().white,
              filled: true,
              hintStyle: GoogleFonts.roboto(
                color: ProjectColors().blue1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: ProjectColors().primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Enter Email Address",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Owner number",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ProjectColors().blue1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            style: GoogleFonts.roboto(
              color: ProjectColors().blue1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            controller: numberController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return CustomStrings().required;
              }
              return null; // Valid input
            },
            keyboardType: TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            decoration: InputDecoration(
              fillColor: ProjectColors().white,
              filled: true,
              hintStyle: GoogleFonts.roboto(
                color: ProjectColors().blue1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: ProjectColors().primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Enter Owner Number",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Manager Number",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ProjectColors().blue1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            style: GoogleFonts.roboto(
              color: ProjectColors().blue1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            controller: manNumberController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return CustomStrings().required;
              }
              return null; // Valid input
            },
            keyboardType: TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            decoration: InputDecoration(
              fillColor: ProjectColors().white,
              filled: true,
              hintStyle: GoogleFonts.roboto(
                color: ProjectColors().blue1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: ProjectColors().primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Enter Manager Number",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "User Name",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ProjectColors().blue1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            style: GoogleFonts.roboto(
              color: ProjectColors().blue1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            controller: usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return CustomStrings().required;
              }
              return null; // Valid input
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              fillColor: ProjectColors().white,
              filled: true,
              hintStyle: GoogleFonts.roboto(
                color: ProjectColors().blue1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: ProjectColors().primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Enter User Name",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Password",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ProjectColors().blue1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            style: GoogleFonts.roboto(
              color: ProjectColors().blue1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return CustomStrings().required;
              }
              return null; // Valid input
            },
            obscureText: passwordVisible,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              fillColor: ProjectColors().white,
              filled: true,
              hintStyle: GoogleFonts.roboto(
                color: ProjectColors().blue1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: ProjectColors().primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "*********",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(22.0),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: ProjectColors().blue1,
                ),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userView() {
    return Form(
      key: _userFormKey,
      child: Column(
        spacing: 10,
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Full Name",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ProjectColors().blue1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            style: GoogleFonts.roboto(
              color: ProjectColors().blue1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            controller: regNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return CustomStrings().required;
              }
              return null; // Valid input
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              fillColor: ProjectColors().white,
              filled: true,
              hintStyle: GoogleFonts.roboto(
                color: ProjectColors().blue1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: ProjectColors().primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Enter Full Name",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Email Address",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ProjectColors().blue1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            style: GoogleFonts.roboto(
              color: ProjectColors().blue1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            controller: regEmailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return CustomStrings().required;
              } else if (!RegExp(
                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
              ).hasMatch(value)) {
                return CustomStrings().invalidEmail;
              }
              return null; // Valid input
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              fillColor: ProjectColors().white,
              filled: true,
              hintStyle: GoogleFonts.roboto(
                color: ProjectColors().blue1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: ProjectColors().primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Enter Email Address",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Phone number",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ProjectColors().blue1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            style: GoogleFonts.roboto(
              color: ProjectColors().blue1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            controller: regNumberController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return CustomStrings().required;
              }
              return null; // Valid input
            },
            keyboardType: TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            decoration: InputDecoration(
              fillColor: ProjectColors().white,
              filled: true,
              hintStyle: GoogleFonts.roboto(
                color: ProjectColors().blue1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: ProjectColors().primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Enter Phone Number",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Password",
              style: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ProjectColors().blue1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.start,
            ),
          ),
          TextFormField(
            style: GoogleFonts.roboto(
              color: ProjectColors().blue1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            controller: regPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return CustomStrings().required;
              }
              return null; // Valid input
            },
            obscureText: regPasswordVisible,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              fillColor: ProjectColors().white,
              filled: true,
              hintStyle: GoogleFonts.roboto(
                color: ProjectColors().blue1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: ProjectColors().primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22.0),
                borderSide: BorderSide(color: Colors.red.shade800, width: 1),
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "*********",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
                borderRadius: BorderRadius.circular(22.0),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  regPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: ProjectColors().blue1,
                ),
                onPressed: () {
                  setState(() {
                    regPasswordVisible = !regPasswordVisible;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
