import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/features/authentication/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  AppColors appColors = AppColors();
  TextEditingController email = TextEditingController();
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
                                  .verticalScale(256),
                              width: double.infinity,
                              color: appColors.appDarkColor,
                            ),
                            Container(
                              height: ResponsiveFlutter.of(context)
                                  .verticalScale(19),
                              width: double.infinity,
                              color: appColors.appMediumColor,
                            ),
                          ],
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
                                    .verticalScale(10)),
                            Container(
                              height: ResponsiveFlutter.of(context)
                                  .verticalScale(210),
                              padding: EdgeInsets.symmetric(
                                  horizontal: ResponsiveFlutter.of(context)
                                      .moderateScale(25)),
                              child: Image.asset(
                                ImagePath.forgotPasswordImage,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(
                          ResponsiveFlutter.of(context).moderateScale(20)),
                      color: appColors.appMediumColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MyTextView(
                            Strings.forgotPassword,
                            styleNew: MyTextStyle(
                              colorNew: appColors.lightColor,
                              size: ResponsiveFlutter.of(context).fontSize(3.7),
                              fontWeightNew: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height: ResponsiveFlutter.of(context)
                                  .verticalScale(5)),
                          MyTextView(
                            Strings.pleaseFillYourEmail,
                            maxLineWrap: true,
                            styleNew: MyTextStyle(
                              colorNew: appColors.mediumGrayColor,
                              size: ResponsiveFlutter.of(context).fontSize(1.8),
                              fontWeightNew: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                              height: ResponsiveFlutter.of(context)
                                  .verticalScale(25)),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                height: ResponsiveFlutter.of(context)
                                    .verticalScale(80),
                                padding: EdgeInsets.symmetric(
                                  vertical: ResponsiveFlutter.of(context)
                                      .moderateScale(20),
                                  horizontal: ResponsiveFlutter.of(context)
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
                                child: Column(
                                  children: [
                                    commonTestField(
                                      context: context,
                                      controller: email,
                                      hintText: Strings.emailAddress,
                                      image: ImagePath.email,
                                      keyboardType: TextInputType.emailAddress,
                                      obscureText: false,
                                      icon: true,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ResponsiveFlutter.of(context)
                                      .moderateScale(55),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: commonButton(
                                    context: context,
                                    title: Strings.submit,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
