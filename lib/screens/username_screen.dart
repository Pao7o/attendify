import 'package:attendify/features/common/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import '../features/authentication/screens/email_verification_screen.dart';
import '../features/common/app_colors.dart';
import '../features/common/common_widget.dart';
import '../features/common/image_path.dart';
import '../features/common/strings.dart';
import '../features/common/utils.dart';
import '../features/firebase/controller/firebase_auth_controller.dart';
import '../responsive/responsive_flutter.dart';

class UsernameScreen extends StatefulWidget {
  @override
  _UsernameScreenState createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            backgroundColor: appColors.appMediumColor,
            body: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: ResponsiveFlutter.of(context)
                                      .verticalScale(15),
                                  width: double.infinity,
                                  color: appColors.appMediumColor,
                                ),
                              ],
                            ),
                            Container(
                              color: appColors.appDarkColor,
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImagePath.logo,
                                    height: ResponsiveFlutter.of(context)
                                        .verticalScale(30),
                                  ),
                                  SizedBox(
                                      height: ResponsiveFlutter.of(context)
                                          .verticalScale(0)),
                                  Image.asset(
                                    ImagePath.username,
                                    alignment: Alignment.bottomCenter,
                                    height: 300,
                                    width: double.infinity,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(
                                ResponsiveFlutter.of(context)
                                    .moderateScale(20)),
                            color: appColors.appMediumColor,
                            child: Column(
                              children: [
                                Text("It's time to choose your username !",
                                    style: TextStyle(
                                        color: appColors.lightColor,
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(2.5))),
                                SizedBox(height: 5,),
                                Text("(Don't worry, you can modify it later)",
                                    style: TextStyle(
                                    color: appColors.lightColor,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.5))),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          style:TextStyle(color: appColors.lightColor),
                                          cursorColor:appColors.lightColor,
                                          cursorHeight: 25,
                                          controller: _usernameController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            labelText: "Username",
                                            labelStyle:TextStyle(color: appColors.lightColor)
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Please enter a username";
                                            }
                                            if (value.length < 4) {
                                              return "Username must be more than 4 characters";
                                            }
                                            if (value.length > 30) {
                                              return "Username must be less than 30 characters";
                                            }
                                            if (value.contains(" ")) {
                                              return "Username cannot contain spaces";
                                            }
                                            if (!RegExp(r"^[a-zA-Z0-9._]+$")
                                                .hasMatch(value)) {
                                              return "Username can only contain letters, numbers, '.' and '_'";
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(height: 16.0),
                                        SizedBox(
                                          width: 250,
                                          height: 50,
                                          child: MaterialButton(
                                            color: Colors.green[400],
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.0),
                                                side: BorderSide(color: Colors.black)),
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                // Save the username
                                              }
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 65.0),
                                                  child: Text("Continue",style: TextStyle(color: appColors.lightColor,
                                                      fontSize:ResponsiveFlutter.of(context)
                                                      .fontSize(2) ),),
                                                ),
                                                SizedBox(width: 50,),
                                                Icon(Icons.arrow_forward, color: appColors.lightColor)
                                              ],
                                            )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
