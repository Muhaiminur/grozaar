import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grozaar/core/singleton/logger.dart';
import 'package:grozaar/core/utility/colors.dart';
import 'package:grozaar/core/utility/customStrings.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';

import '../../../core/singleton/shared_pref.dart';
import '../../../core/utility/custom_appbar.dart';
import '../../core/provider/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageScreenState createState() => LoginPageScreenState();
}

class LoginPageScreenState extends State<LoginPage> {
  String logged = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible = true;
  bool remember = true;

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
      backgroundColor: ProjectColors().white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight), // Set
        child: CustomAppBar(
          title: CustomStrings().login,
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
                        "Welcome Back",
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
                        "Login to access your account",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ProjectColors().blue1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),

                      Form(
                        key: _formKey,
                        child: Column(
                          spacing: 10,
                          children: <Widget>[
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                "Phone Number",
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
                              controller: usernameController,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                // ✅ only numbers
                                LengthLimitingTextInputFormatter(11),
                                // ✅ max 11 digits
                              ],
                              style: GoogleFonts.roboto(
                                color: ProjectColors().blue1,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return CustomStrings().required;
                                }
                                if (value.length != 11) {
                                  return "Phone number must be 11 digits";
                                }
                                if (!value.startsWith('01')) {
                                  return "Phone number must start with 01";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                fillColor: ProjectColors().white,
                                filled: true,
                                hintText: "Enter Phone Number",
                                hintStyle: GoogleFonts.roboto(
                                  color: ProjectColors().blue1,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                contentPadding: const EdgeInsets.fromLTRB(
                                  20,
                                  15,
                                  20,
                                  15,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: ProjectColors().white4,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: ProjectColors().primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red.shade800,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red.shade800,
                                  ),
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
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                                // ✅ max 11 digits
                              ],
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
                                  borderSide: BorderSide(
                                    color: Colors.red.shade800,
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(22.0),
                                  borderSide: BorderSide(
                                    color: ProjectColors().primaryColor,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(22.0),
                                  borderSide: BorderSide(
                                    color: Colors.red.shade800,
                                    width: 1,
                                  ),
                                ),
                                contentPadding: EdgeInsets.fromLTRB(
                                  20.0,
                                  15.0,
                                  20.0,
                                  15.0,
                                ),
                                hintText: "*********",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: ProjectColors().white4,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: ProjectColors().white4,
                                  ),
                                  borderRadius: BorderRadius.circular(22.0),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListTile(
                              minLeadingWidth: 0,
                              contentPadding: EdgeInsets.all(0),
                              horizontalTitleGap: 0,
                              leading: Checkbox(
                                value: remember,
                                onChanged: (value) {
                                  setState(() {
                                    remember = !remember;
                                  });
                                },
                              ),
                              title: Text(
                                "Remember me",
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ProjectColors().blue3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              //_showBottomView();
                              _showDialog(context);
                              //_showPasswordDialog(context);
                            },
                            child: Text(
                              "Forget Password?",
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ProjectColors().blue1,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0),

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
                            if (_formKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              context
                                  .read<AuthProvider>()
                                  .signInCall(
                                    password: passwordController.text,
                                    username: usernameController.text,
                                  )
                                  .then((value) {
                                    if (value == 200) {
                                      if (!context.mounted) return;
                                      SharedPref.setModel(
                                        CustomStrings().loginModel,
                                        context
                                            .read<AuthProvider>()
                                            .logInResponse
                                            .data,
                                      );
                                      SharedPref.setString(
                                        CustomStrings().token,
                                        "Bearer ${context.read<AuthProvider>().logInResponse.data!.token!}",
                                      );
                                      Restart.restartApp();
                                      /*Navigator.pushReplacementNamed(
                                        context,
                                        mainPage,
                                      );*/
                                    }
                                  });
                            }
                          },
                          child: Text(
                            "Sign In",
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

  void _showBottomView() {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (
            BuildContext context,
            void Function(void Function()) changeState,
          ) {
            final usernameController = TextEditingController();

            return Container(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                        borderSide: BorderSide(
                          color: Colors.red.shade800,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        borderSide: BorderSide(
                          color: ProjectColors().primaryColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0),
                        borderSide: BorderSide(
                          color: Colors.red.shade800,
                          width: 1,
                        ),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(
                        20.0,
                        15.0,
                        20.0,
                        15.0,
                      ),
                      hintText: "Enter Email",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: ProjectColors().white4,
                        ),
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: ProjectColors().white4,
                        ),
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(10),
                        ),
                        backgroundColor: WidgetStateProperty.all<Color>(
                          ProjectColors().primaryColor,
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: ProjectColors().white),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (usernameController.text.isNotEmpty) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          Navigator.pop(context);
                          context
                              .read<AuthProvider>()
                              .forgetPassword(email: usernameController.text)
                              .then((value) {
                                if (value == 200) {
                                  /*Log().showMessageToast(
                                    message: "Please Check Your Email",
                                  );*/
                                  //Navigator.pop(context);
                                }
                              });
                        } else {
                          Log().showMessageToast(message: "Please Enter Email");
                        }
                      },
                      child: Text(
                        "Forget",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ProjectColors().white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showDialog(BuildContext contextPage) {
    showDialog(
      context: contextPage,
      useSafeArea: true,
      barrierDismissible: false,
      builder: (BuildContext context) {
        final usernameController = TextEditingController();
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Enter Your Phone",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ProjectColors().primaryColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              // ✅ only numbers
              LengthLimitingTextInputFormatter(11),
              // ✅ max 11 digits
            ],
            style: GoogleFonts.roboto(
              color: ProjectColors().blue1,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return CustomStrings().required;
              }
              if (value.length != 11) {
                return "Phone number must be 11 digits";
              }
              if (!value.startsWith('01')) {
                return "Phone number must start with 01";
              }
              return null;
            },
            maxLines: 1,
            controller: usernameController,
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
                borderSide: BorderSide(width: 1, color: ProjectColors().white4),
                borderRadius: BorderRadius.circular(22.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: ProjectColors().white4),
                borderRadius: BorderRadius.circular(22.0),
              ),
            ),
          ),

          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(10),
                ),
                backgroundColor: WidgetStateProperty.all<Color>(
                  ProjectColors().primaryColor,
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: ProjectColors().white),
                  ),
                ),
              ),
              onPressed: () {
                if (usernameController.text.isNotEmpty) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pop(context);
                  contextPage
                      .read<AuthProvider>()
                      .forgetPassword(email: usernameController.text)
                      .then((value) {
                        if (value == 200||true) {
                          _showPasswordDialog(contextPage);
                          /*Log().showMessageToast(
                                    message: "Please Check Your Email",
                                  );*/
                          //Navigator.pop(context);
                        }
                      });
                } else {
                  Log().showMessageToast(message: "Please Enter Phone");
                }
              },
              child: Text(
                "Submit",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ProjectColors().white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showPasswordDialog(BuildContext contextPage) {
    showDialog(
      context: contextPage,
      useSafeArea: true,
      barrierDismissible: false,
      builder: (BuildContext context) {
        final passController = TextEditingController();
        final conPassController = TextEditingController();
        final otpController = TextEditingController();
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Update Your Password",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ProjectColors().primaryColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              TextFormField(
                style: GoogleFonts.roboto(
                  color: ProjectColors().blue1,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                controller: otpController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return CustomStrings().required;
                  }
                  return null; // Valid input
                },
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    borderSide: BorderSide(
                      color: Colors.red.shade800,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    borderSide: BorderSide(color: ProjectColors().primaryColor),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    borderSide: BorderSide(
                      color: Colors.red.shade800,
                      width: 1,
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter OTP",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: ProjectColors().white4,
                    ),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: ProjectColors().white4,
                    ),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                ),
              ),
              TextFormField(
                style: GoogleFonts.roboto(
                  color: ProjectColors().blue1,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                controller: passController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return CustomStrings().required;
                  }
                  return null; // Valid input
                },
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
                    borderSide: BorderSide(
                      color: Colors.red.shade800,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    borderSide: BorderSide(color: ProjectColors().primaryColor),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    borderSide: BorderSide(
                      color: Colors.red.shade800,
                      width: 1,
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: ProjectColors().white4,
                    ),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: ProjectColors().white4,
                    ),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                ),
              ),
              TextFormField(
                style: GoogleFonts.roboto(
                  color: ProjectColors().blue1,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                controller: conPassController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return CustomStrings().required;
                  }
                  if (value != conPassController.text) {
                    return "Password And Confirm Password Did Not Match";
                  }
                  return null; // Valid input
                },
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
                    borderSide: BorderSide(
                      color: Colors.red.shade800,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    borderSide: BorderSide(color: ProjectColors().primaryColor),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    borderSide: BorderSide(
                      color: Colors.red.shade800,
                      width: 1,
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter Confirm Password",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: ProjectColors().white4,
                    ),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: ProjectColors().white4,
                    ),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                ),
              ),
            ],
          ),

          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(10),
                ),
                backgroundColor: WidgetStateProperty.all<Color>(
                  ProjectColors().primaryColor,
                ),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: ProjectColors().white),
                  ),
                ),
              ),
              onPressed: () {
                if (conPassController.text.isNotEmpty &&
                    passController.text.isNotEmpty &&
                    otpController.text.isNotEmpty) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pop(context);
                  contextPage
                      .read<AuthProvider>()
                      .forgetPasswordUpdate(
                        otp: otpController.text,
                        pass: conPassController.text,
                      )
                      .then((value) {
                        if (value == 200) {
                          Log().showMessageToast(
                            message: "Please Login with your new password",
                          );
                          Navigator.pop(contextPage);
                        }
                      });
                } else {
                  Log().showMessageToast(message: "Required All Information");
                }
              },
              child: Text(
                "Submit",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ProjectColors().white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
