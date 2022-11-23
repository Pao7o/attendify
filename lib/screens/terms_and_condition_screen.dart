import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:flutter/material.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({Key? key}) : super(key: key);
  @override
  _TermsAndConditionScreenState createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  AppColors appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            commonAppBar(
              title: Strings.termsCondition,
              backArrow: true,
              context: context,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  vertical: ResponsiveFlutter.of(context).moderateScale(20),
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                ),
                children: [
                  MyTextView(
                    Strings.dummyText7,
                    textAligntNew: TextAlign.start,
                    styleNew: MyTextStyle(
                      colorNew: appColors.lightColor,
                      fontWeightNew: FontWeight.w600,
                      size: ResponsiveFlutter.of(context).fontSize(2.7),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(15),
                  ),
                  MyTextView(
                    Strings.dummyText8,
                    textAligntNew: TextAlign.start,
                    maxLineWrap: true,
                    styleNew: MyTextStyle(
                      colorNew: appColors.lightColor,
                      fontWeightNew: FontWeight.w400,
                      textHeight: 1.3,
                      size: ResponsiveFlutter.of(context).fontSize(2.2),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(15),
                  ),
                  MyTextView(
                    Strings.dummyText9,
                    textAligntNew: TextAlign.start,
                    styleNew: MyTextStyle(
                      colorNew: appColors.lightColor,
                      fontWeightNew: FontWeight.w600,
                      size: ResponsiveFlutter.of(context).fontSize(2.7),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(15),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            ResponsiveFlutter.of(context).moderateScale(20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: ResponsiveFlutter.of(context)
                                  .moderateScale(10),
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(10),
                              decoration: BoxDecoration(
                                color: appColors.btnColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(10),
                            ),
                            MyTextView(
                              Strings.dummyText10,
                              textAligntNew: TextAlign.start,
                              maxLineWrap: true,
                              styleNew: MyTextStyle(
                                colorNew: appColors.lightColor,
                                fontWeightNew: FontWeight.w400,
                                textHeight: 1.3,
                                size:
                                    ResponsiveFlutter.of(context).fontSize(2.2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                              ResponsiveFlutter.of(context).verticalScale(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: ResponsiveFlutter.of(context)
                                  .moderateScale(10),
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(10),
                              decoration: BoxDecoration(
                                color: appColors.btnColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(10),
                            ),
                            MyTextView(
                              Strings.dummyText10,
                              textAligntNew: TextAlign.start,
                              maxLineWrap: true,
                              styleNew: MyTextStyle(
                                colorNew: appColors.lightColor,
                                fontWeightNew: FontWeight.w400,
                                textHeight: 1.3,
                                size:
                                    ResponsiveFlutter.of(context).fontSize(2.2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                              ResponsiveFlutter.of(context).verticalScale(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: ResponsiveFlutter.of(context)
                                  .moderateScale(10),
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(10),
                              decoration: BoxDecoration(
                                color: appColors.btnColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(10),
                            ),
                            MyTextView(
                              Strings.dummyText10,
                              textAligntNew: TextAlign.start,
                              maxLineWrap: true,
                              styleNew: MyTextStyle(
                                colorNew: appColors.lightColor,
                                fontWeightNew: FontWeight.w400,
                                textHeight: 1.3,
                                size:
                                    ResponsiveFlutter.of(context).fontSize(2.2),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                              ResponsiveFlutter.of(context).verticalScale(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: ResponsiveFlutter.of(context)
                                  .moderateScale(10),
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(10),
                              decoration: BoxDecoration(
                                color: appColors.btnColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(10),
                            ),
                            MyTextView(
                              Strings.dummyText10,
                              textAligntNew: TextAlign.start,
                              maxLineWrap: true,
                              styleNew: MyTextStyle(
                                colorNew: appColors.lightColor,
                                fontWeightNew: FontWeight.w400,
                                textHeight: 1.3,
                                size:
                                    ResponsiveFlutter.of(context).fontSize(2.2),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(15),
                  ),
                  MyTextView(
                    Strings.dummyText11,
                    textAligntNew: TextAlign.start,
                    maxLineWrap: true,
                    styleNew: MyTextStyle(
                      colorNew: appColors.lightColor,
                      fontWeightNew: FontWeight.w400,
                      textHeight: 1.3,
                      size: ResponsiveFlutter.of(context).fontSize(2.2),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(15),
                  ),
                  MyTextView(
                    Strings.dummyText12,
                    textAligntNew: TextAlign.start,
                    styleNew: MyTextStyle(
                      colorNew: appColors.lightColor,
                      fontWeightNew: FontWeight.w600,
                      size: ResponsiveFlutter.of(context).fontSize(2.7),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(15),
                  ),
                  MyTextView(
                    Strings.dummyText13,
                    textAligntNew: TextAlign.start,
                    maxLineWrap: true,
                    styleNew: MyTextStyle(
                      colorNew: appColors.lightColor,
                      fontWeightNew: FontWeight.w400,
                      textHeight: 1.3,
                      size: ResponsiveFlutter.of(context).fontSize(2.2),
                    ),
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
