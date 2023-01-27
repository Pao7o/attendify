import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/features/common/utils.dart';
import 'package:attendify/features/firebase/controller/firebase_auth_controller.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'email_verification_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const String routeName = "/signup_screen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();
  TextEditingController? email = TextEditingController();
  TextEditingController? password = TextEditingController();
  TextEditingController? firstName = TextEditingController();
  TextEditingController? lastName = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
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
                                      .verticalScale(260),
                                  width: double.infinity,
                                  color: appColors.appDarkColor,
                                ),
                                Container(
                                  height: ResponsiveFlutter.of(context)
                                      .verticalScale(15),
                                  width: double.infinity,
                                  color: appColors.appMediumColor,
                                ),
                              ],
                            ),
                            Positioned(
                              top: 0,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: ResponsiveFlutter.of(context)
                                        .verticalScale(30)),
                                child: Image.asset(
                                  imagePath.registerImageBG,
                                  alignment: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  ImagePath.logo,
                                  height: ResponsiveFlutter.of(context)
                                      .verticalScale(30),
                                ),
                                SizedBox(
                                    height: ResponsiveFlutter.of(context)
                                        .verticalScale(20)),
                                Container(
                                  height: ResponsiveFlutter.of(context)
                                      .verticalScale(200),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ResponsiveFlutter.of(context)
                                          .moderateScale(25)),
                                  child: Image.asset(
                                    ImagePath.registerImage,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                ),
                              ],
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyTextView(
                                  Strings.signUp,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.lightColor,
                                    size: ResponsiveFlutter.of(context)
                                        .fontSize(3.7),
                                    fontWeightNew: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height: ResponsiveFlutter.of(context)
                                        .verticalScale(5)),
                                MyTextView(
                                  Strings.pleaseFillTheDetails,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.mediumGrayColor,
                                    size: ResponsiveFlutter.of(context)
                                        .fontSize(1.8),
                                    fontWeightNew: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                    height: ResponsiveFlutter.of(context)
                                        .verticalScale(15)),
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      height: ResponsiveFlutter.of(context)
                                          .verticalScale(170),
                                      padding: EdgeInsets.symmetric(
                                        vertical: ResponsiveFlutter.of(context)
                                            .moderateScale(20),
                                        horizontal:
                                            ResponsiveFlutter.of(context)
                                                .moderateScale(25),
                                      ),
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.only(
                                          bottom: ResponsiveFlutter.of(context)
                                              .moderateScale(25)),
                                      decoration: BoxDecoration(
                                        color: appColors.appLightColor,
                                        borderRadius: BorderRadius.circular(
                                          ResponsiveFlutter.of(context)
                                              .moderateScale(25),
                                        ),
                                      ),
                                      child: Form(
                                        key: _formKey,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: commonTestField(
                                                      validateFunction: (p0) {
                                                        if (p0 == null ||
                                                            p0.isEmpty) {
                                                          return "Enter First Name";
                                                        }
                                                        if (!RegExp(
                                                                r'^[a-zA-Z]')
                                                            .hasMatch(p0)) {
                                                          return "Enter a valid First Name";
                                                        }
                                                        return null;
                                                      },
                                                      context: context,
                                                      controller: firstName,
                                                      hintText:
                                                          Strings.firstName,
                                                      image: ImagePath.avatar,
                                                      keyboardType:
                                                          TextInputType.name,
                                                      obscureText: false,
                                                      icon: true,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: commonTestField(
                                                      validateFunction: (p0) {
                                                        if (p0 == null ||
                                                            p0.isEmpty) {
                                                          return "Enter Last Name";
                                                        }
                                                        if (!RegExp(
                                                                r'^[a-zA-Z]')
                                                            .hasMatch(p0)) {
                                                          return "Enter a valid First Name";
                                                        }
                                                        return null;
                                                      },
                                                      context: context,
                                                      controller: lastName,
                                                      hintText:
                                                          Strings.lastName,
                                                      image: ImagePath.avatar,
                                                      keyboardType:
                                                          TextInputType.name,
                                                      obscureText: false,
                                                      icon: true,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  height: ResponsiveFlutter.of(
                                                          context)
                                                      .verticalScale(20)),
                                              commonTestField(
                                                validateFunction: (p0) {
                                                  if (p0 == null ||
                                                      p0.isEmpty) {
                                                    return "Field is empty";
                                                  }
                                                  if (!EmailValidator.validate(
                                                      p0)) {
                                                    return "Enter a valid Email Address";
                                                  }
                                                  return null;
                                                },
                                                context: context,
                                                controller: email,
                                                hintText: Strings.emailAddress,
                                                image: ImagePath.email,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                obscureText: false,
                                                icon: true,
                                              ),
                                              SizedBox(
                                                  height: ResponsiveFlutter.of(
                                                          context)
                                                      .verticalScale(20)),
                                              commonTestField(
                                                validateFunction: (p0) {
                                                  if (p0 == null ||
                                                      p0.isEmpty) {
                                                    return "Field is empty";
                                                  }
                                                  return null;
                                                },
                                                context: context,
                                                controller: password,
                                                hintText: Strings.password,
                                                image: ImagePath.password,
                                                keyboardType: TextInputType
                                                    .visiblePassword,
                                                obscureText: true,
                                                icon: true,
                                              ),
                                              Visibility(
                                                child: FlutterPwValidator(
                                                    width: 400,
                                                    height: 150,
                                                    minLength: 0,
                                                    onSuccess: () {},
                                                    controller: password!),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ResponsiveFlutter.of(context)
                                                .moderateScale(55),
                                      ),
                                      child: GestureDetector(
                                        onTap: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            Utils().sendingEmailDialog(
                                                context: context,
                                                email: email!.text.trim());
                                            await ref
                                                .read(
                                                    firebaseAutheControllerProvider)
                                                .signupWithEmailandPassword(
                                                    context: context,
                                                    email: email!.text.trim(),
                                                    password: password!.text)
                                                .then((value) {
                                              if (value == true) {
                                                Navigator.pop(context);
                                                Navigator.pushNamed(context,
                                                    EmailVerification.routeName,
                                                    arguments:
                                                        email!.text.trim());
                                              }
                                            });
                                          }
                                        },
                                        child: commonButton(
                                          context: context,
                                          title: Strings.signUp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // code à exécuter lorsque le GestureDetector est tapé
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(ResponsiveFlutter.of(context)
                                        .moderateScale(8.5)),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width:ResponsiveFlutter.of(context)
                                            .scale(170),
                                        height: ResponsiveFlutter.of(context)
                                            .verticalScale(35),
                                        child: MaterialButton(
                                          onPressed: () {
                                          },
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                "assets/images/ic_google.png",
                                                width: ResponsiveFlutter.of(context)
                                                    .scale(25),
                                                height: ResponsiveFlutter.of(context)
                                                    .verticalScale(25),
                                              ),
                                              SizedBox(width: ResponsiveFlutter.of(context)
                                                  .scale(10)),
                                              Text('Sign up with Google',style: TextStyle(
                                                fontFamily: 'Google',
                                                fontWeight: FontWeight.w600,
                                              ),),
                                            ],
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30.0),
                                          ),
                                          color: Colors.white,
                                          textColor: Colors.black,
                                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: MyTextView(
                                    Strings.doNotHaveAnAccount,
                                    textAligntNew: TextAlign.center,
                                    styleNew: MyTextStyle(
                                      colorNew: appColors.mediumGrayColor,
                                      fontWeightNew: FontWeight.w400,
                                      size: ResponsiveFlutter.of(context)
                                          .fontSize(1.8),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    height: ResponsiveFlutter.of(context)
                                        .verticalScale(2)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: MyTextView(
                                      Strings.login,
                                      textAligntNew: TextAlign.center,
                                      styleNew: MyTextStyle(
                                        colorNew: appColors.lightPinkColor,
                                        fontWeightNew: FontWeight.bold,
                                        size: ResponsiveFlutter.of(context)
                                            .fontSize(2),
                                      ),
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
