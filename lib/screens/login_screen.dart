import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/image_path.dart';
import 'package:attendify/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/bottom_bar_screen.dart';
import 'package:attendify/screens/forgot_password_screen.dart';
import 'package:attendify/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: ResponsiveFlutter.of(context).verticalScale(260),
                              width: double.infinity,
                              color: appColors.appDarkColor,
                            ),
                            Container(
                              height: ResponsiveFlutter.of(context).verticalScale(15),
                              width: double.infinity,
                              color: appColors.appMediumColor,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              ImagePath.logo,
                              height: ResponsiveFlutter.of(context).verticalScale(30),
                              color: appColors.lightColor,
                            ),
                            SizedBox(height: ResponsiveFlutter.of(context).verticalScale(20)),
                            Container(
                              height: ResponsiveFlutter.of(context).verticalScale(200),
                              padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).moderateScale(25)),
                              child: Image.asset(
                                imagePath.loginImage,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(20)),
                        color: appColors.appMediumColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyTextView(
                              Strings.login,
                              styleNew: MyTextStyle(
                                colorNew: appColors.lightColor,
                                size: ResponsiveFlutter.of(context).fontSize(3.7),
                                fontWeightNew: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: ResponsiveFlutter.of(context).verticalScale(5)),
                            MyTextView(
                              Strings.pleaseFillTheDetails,
                              styleNew: MyTextStyle(
                                colorNew: appColors.mediumGrayColor,
                                size: ResponsiveFlutter.of(context).fontSize(1.8),
                                fontWeightNew: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: ResponsiveFlutter.of(context).verticalScale(25)),
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: ResponsiveFlutter.of(context).verticalScale(120),
                                  padding: EdgeInsets.symmetric(
                                    vertical: ResponsiveFlutter.of(context).moderateScale(20),
                                    horizontal: ResponsiveFlutter.of(context).moderateScale(25),
                                  ),
                                  margin: EdgeInsets.only(bottom: ResponsiveFlutter.of(context).moderateScale(25)),
                                  decoration: BoxDecoration(
                                    color: appColors.appLightColor,
                                    borderRadius: BorderRadius.circular(
                                      ResponsiveFlutter.of(context).moderateScale(25),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        commonTestField(
                                          context: context,
                                          controller: email,
                                          hintText: Strings.emailAddress,
                                          image: ImagePath.email,
                                          keyboardType: TextInputType.emailAddress,
                                          icon: true,
                                        ),
                                        SizedBox(height: ResponsiveFlutter.of(context).verticalScale(20)),
                                        commonTestField(
                                          context: context,
                                          controller: password,
                                          hintText: Strings.password,
                                          image: ImagePath.password,
                                          keyboardType: TextInputType.visiblePassword,
                                          obscureText: true,
                                          icon: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).moderateScale(55)),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const BottomBarScreen(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: commonButton(
                                      context: context,
                                      title: Strings.login,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: ResponsiveFlutter.of(context).verticalScale(25)),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ForgotPasswordScreen(),
                                  ),
                                );
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: MyTextView(
                                  Strings.forgotPassword,
                                  textAligntNew: TextAlign.center,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.lightColor,
                                    fontWeightNew: FontWeight.bold,
                                    size: ResponsiveFlutter.of(context).fontSize(2),
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.center,
                              child: MyTextView(
                                Strings.doNotHaveAnAccount,
                                textAligntNew: TextAlign.center,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.mediumGrayColor,
                                  fontWeightNew: FontWeight.w400,
                                  size: ResponsiveFlutter.of(context).fontSize(1.8),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: MyTextView(
                                  Strings.signUp,
                                  textAligntNew: TextAlign.center,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.lightPinkColor,
                                    fontWeightNew: FontWeight.bold,
                                    size: ResponsiveFlutter.of(context).fontSize(2),
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
        ),
      ),
    );
  }
}
