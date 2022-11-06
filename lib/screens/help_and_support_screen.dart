import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/constants.dart';
import 'package:attendify/common/image_path.dart';
import 'package:attendify/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({Key? key}) : super(key: key);
  @override
  _HelpAndSupportScreenState createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  AppColors appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            commonAppBar(
              title: Strings.helpSupport,
              context: context,
              backArrow: true,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                  vertical: ResponsiveFlutter.of(context).moderateScale(15),
                ),
                shrinkWrap: false,
                children: [
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(210),
                    width: double.infinity,
                    child: Image.asset(ImagePath.helpAndSupport),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(20),
                  ),
                  Column(
                    children: [
                      MyTextView(
                        Strings.howCanWeHelpYou,
                        textAligntNew: TextAlign.center,
                        styleNew: MyTextStyle(
                          colorNew: appColors.lightColor,
                          fontWeightNew: FontWeight.w600,
                          size: ResponsiveFlutter.of(context).fontSize(2.7),
                        ),
                      ),
                      SizedBox(
                        height: ResponsiveFlutter.of(context).verticalScale(20),
                      ),
                      MyTextView(
                        Strings.dummyText1,
                        textAligntNew: TextAlign.center,
                        maxLineWrap: true,
                        styleNew: MyTextStyle(
                          colorNew: appColors.lightColor,
                          fontWeightNew: FontWeight.w200,
                          size: ResponsiveFlutter.of(context).fontSize(2),
                        ),
                      ),
                      SizedBox(
                        height: ResponsiveFlutter.of(context).verticalScale(25),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: ResponsiveFlutter.of(context).verticalScale(150),
                              padding: EdgeInsets.symmetric(
                                vertical: ResponsiveFlutter.of(context).moderateScale(25),
                                horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                              ),
                              decoration: BoxDecoration(
                                color: appColors.appLightColor,
                                borderRadius: BorderRadius.circular(
                                  ResponsiveFlutter.of(context).moderateScale(30),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: ResponsiveFlutter.of(context).moderateScale(65),
                                    width: ResponsiveFlutter.of(context).moderateScale(65),
                                    padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(15)),
                                    decoration: BoxDecoration(
                                      color: Constants.darkTheme ? appColors.appDarkColor : appColors.lightPinkColor.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      ImagePath.phone,
                                      height: ResponsiveFlutter.of(context).moderateScale(70),
                                    ),
                                  ),
                                  const Spacer(),
                                  MyTextView(
                                    Strings.call,
                                    textAligntNew: TextAlign.center,
                                    styleNew: MyTextStyle(
                                      colorNew: appColors.lightColor,
                                      fontWeightNew: FontWeight.w600,
                                      size: ResponsiveFlutter.of(context).fontSize(2),
                                    ),
                                  ),
                                  SizedBox(
                                    height: ResponsiveFlutter.of(context).verticalScale(3),
                                  ),
                                  MyTextView(
                                    Strings.dummyText2,
                                    textAligntNew: TextAlign.center,
                                    maxLineWrap: true,
                                    styleNew: MyTextStyle(
                                      colorNew: appColors.greyTextColor,
                                      fontWeightNew: FontWeight.w500,
                                      size: ResponsiveFlutter.of(context).fontSize(1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ResponsiveFlutter.of(context).moderateScale(20),
                          ),
                          Expanded(
                            child: Container(
                              height: ResponsiveFlutter.of(context).verticalScale(150),
                              padding: EdgeInsets.symmetric(
                                vertical: ResponsiveFlutter.of(context).moderateScale(25),
                                horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                              ),
                              decoration: BoxDecoration(
                                color: appColors.appLightColor,
                                borderRadius: BorderRadius.circular(
                                  ResponsiveFlutter.of(context).moderateScale(30),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: ResponsiveFlutter.of(context).moderateScale(65),
                                    width: ResponsiveFlutter.of(context).moderateScale(65),
                                    padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(17)),
                                    decoration: BoxDecoration(
                                      color: Constants.darkTheme ? appColors.appDarkColor : appColors.lightPinkColor.withOpacity(0.1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      ImagePath.mail,
                                      height: ResponsiveFlutter.of(context).moderateScale(70),
                                    ),
                                  ),
                                  const Spacer(),
                                  MyTextView(
                                    Strings.mail,
                                    textAligntNew: TextAlign.center,
                                    styleNew: MyTextStyle(
                                      colorNew: appColors.lightColor,
                                      fontWeightNew: FontWeight.w600,
                                      size: ResponsiveFlutter.of(context).fontSize(2),
                                    ),
                                  ),
                                  SizedBox(
                                    height: ResponsiveFlutter.of(context).verticalScale(3),
                                  ),
                                  MyTextView(
                                    Strings.dummyText3,
                                    textAligntNew: TextAlign.center,
                                    maxLineWrap: true,
                                    styleNew: MyTextStyle(
                                      colorNew: appColors.greyTextColor,
                                      fontWeightNew: FontWeight.w500,
                                      size: ResponsiveFlutter.of(context).fontSize(1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
