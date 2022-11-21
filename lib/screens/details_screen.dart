import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/check_out_screen.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  AppColors appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.60,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.59,
                      width: MediaQuery.of(context).size.width,
                      color: appColors.appMediumColor,
                      child: Image.asset(
                        ImagePath.image_4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            appColors.appMediumColor,
                            Colors.transparent,
                          ],
                          stops: const [0.05, 0.35],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: ResponsiveFlutter.of(context).moderateScale(50),
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top +
                      ResponsiveFlutter.of(context).moderateScale(5),
                  right: ResponsiveFlutter.of(context).moderateScale(20),
                  left: ResponsiveFlutter.of(context).moderateScale(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: appColors.lightColor,
                        size: ResponsiveFlutter.of(context).moderateScale(25),
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      ImagePath.like,
                      height: ResponsiveFlutter.of(context).moderateScale(45),
                      width: ResponsiveFlutter.of(context).moderateScale(45),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.45),
                padding: EdgeInsets.only(
                  right: ResponsiveFlutter.of(context).moderateScale(20),
                  left: ResponsiveFlutter.of(context).moderateScale(20),
                  top: MediaQuery.of(context).padding.top +
                      ResponsiveFlutter.of(context).moderateScale(55),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyTextView(
                            Strings.welcomeParty,
                            textAligntNew: TextAlign.start,
                            maxLineWrap: true,
                            styleNew: MyTextStyle(
                              colorNew: appColors.lightColor,
                              fontWeightNew: FontWeight.w600,
                              size: ResponsiveFlutter.of(context).fontSize(3.3),
                            ),
                          ),
                          SizedBox(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(15)),
                          Container(
                            height:
                                ResponsiveFlutter.of(context).moderateScale(30),
                            width:
                                ResponsiveFlutter.of(context).moderateScale(60),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: appColors.blurBtnColor,
                              borderRadius: BorderRadius.circular(
                                ResponsiveFlutter.of(context).moderateScale(20),
                              ),
                            ),
                            child: MyTextView(
                              Strings.dance,
                              textAligntNew: TextAlign.center,
                              maxLineWrap: true,
                              styleNew: MyTextStyle(
                                colorNew: appColors.lightPinkColor,
                                fontWeightNew: FontWeight.w500,
                                size:
                                    ResponsiveFlutter.of(context).fontSize(1.4),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(20)),
                      MyTextView(
                        Strings.dummyText27,
                        textAligntNew: TextAlign.start,
                        maxLineWrap: true,
                        maxLinesNew: 2,
                        styleNew: MyTextStyle(
                          colorNew: appColors.lightColor,
                          fontWeightNew: FontWeight.w400,
                          size: ResponsiveFlutter.of(context).fontSize(1.7),
                        ),
                      ),
                      SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(15)),
                      Row(
                        children: [
                          Image.asset(
                            ImagePath.calender,
                            color: appColors.lightColor,
                            height:
                                ResponsiveFlutter.of(context).moderateScale(15),
                          ),
                          SizedBox(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(8)),
                          MyTextView(
                            Strings.dummyText22,
                            textAligntNew: TextAlign.start,
                            maxLineWrap: true,
                            styleNew: MyTextStyle(
                              colorNew: appColors.lightColor,
                              fontWeightNew: FontWeight.w400,
                              size: ResponsiveFlutter.of(context).fontSize(1.6),
                            ),
                          ),
                          SizedBox(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(20)),
                          Image.asset(
                            ImagePath.time,
                            color: appColors.lightColor,
                            height:
                                ResponsiveFlutter.of(context).moderateScale(15),
                          ),
                          SizedBox(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(8)),
                          MyTextView(
                            Strings.dummyText23,
                            textAligntNew: TextAlign.start,
                            maxLineWrap: true,
                            styleNew: MyTextStyle(
                              colorNew: appColors.lightColor,
                              fontWeightNew: FontWeight.w400,
                              size: ResponsiveFlutter.of(context).fontSize(1.6),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(20)),
                      Container(
                        height: ResponsiveFlutter.of(context).moderateScale(65),
                        width: double.infinity,
                        padding: EdgeInsets.all(
                            ResponsiveFlutter.of(context).moderateScale(10)),
                        decoration: BoxDecoration(
                          color: appColors.appLightColor,
                          borderRadius: BorderRadius.circular(
                            ResponsiveFlutter.of(context).moderateScale(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                                width: ResponsiveFlutter.of(context)
                                    .moderateScale(10)),
                            Image.asset(
                              ImagePath.location,
                              color: appColors.lightColor,
                              height: ResponsiveFlutter.of(context)
                                  .moderateScale(20),
                            ),
                            SizedBox(
                                width: ResponsiveFlutter.of(context)
                                    .moderateScale(8)),
                            MyTextView(
                              Strings.dummyText36,
                              textAligntNew: TextAlign.start,
                              maxLineWrap: true,
                              styleNew: MyTextStyle(
                                colorNew: appColors.lightColor,
                                fontWeightNew: FontWeight.w500,
                                size:
                                    ResponsiveFlutter.of(context).fontSize(1.8),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(45),
                              height: double.infinity,
                              padding: EdgeInsets.all(
                                  ResponsiveFlutter.of(context)
                                      .moderateScale(15)),
                              decoration: BoxDecoration(
                                color: appColors.lightPinkColor,
                                borderRadius: BorderRadius.circular(
                                  ResponsiveFlutter.of(context)
                                      .moderateScale(13),
                                ),
                              ),
                              child: Image.asset(ImagePath.mapIcon),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(25)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: ResponsiveFlutter.of(context)
                                    .moderateScale(45),
                                width: ResponsiveFlutter.of(context)
                                    .moderateScale(45),
                                decoration: BoxDecoration(
                                  color: appColors.appLightColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: appColors.appMediumColor,
                                    width: ResponsiveFlutter.of(context)
                                        .moderateScale(2.5),
                                  ),
                                ),
                                child: Image.asset(
                                  ImagePath.image_5,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height: ResponsiveFlutter.of(context)
                                    .moderateScale(45),
                                width: ResponsiveFlutter.of(context)
                                    .moderateScale(45),
                                margin: EdgeInsets.only(
                                    left: ResponsiveFlutter.of(context)
                                        .moderateScale(30)),
                                decoration: BoxDecoration(
                                  color: appColors.appLightColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: appColors.appMediumColor,
                                    width: ResponsiveFlutter.of(context)
                                        .moderateScale(2.5),
                                  ),
                                ),
                                child: Image.asset(
                                  ImagePath.image_5,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                height: ResponsiveFlutter.of(context)
                                    .moderateScale(45),
                                width: ResponsiveFlutter.of(context)
                                    .moderateScale(45),
                                margin: EdgeInsets.only(
                                    left: ResponsiveFlutter.of(context)
                                        .moderateScale(60)),
                                decoration: BoxDecoration(
                                  color: appColors.appLightColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: appColors.appMediumColor,
                                    width: ResponsiveFlutter.of(context)
                                        .moderateScale(2.5),
                                  ),
                                ),
                                child: Image.asset(
                                  ImagePath.image_5,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(10)),
                          MyTextView(
                            "26 " + Strings.participate,
                            textAligntNew: TextAlign.start,
                            maxLineWrap: true,
                            styleNew: MyTextStyle(
                              colorNew: appColors.lightPinkColor,
                              fontWeightNew: FontWeight.w500,
                              size: ResponsiveFlutter.of(context).fontSize(1.8),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextView(
                                "200",
                                textAligntNew: TextAlign.start,
                                maxLineWrap: true,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.lightColor,
                                  fontWeightNew: FontWeight.w600,
                                  size:
                                      ResponsiveFlutter.of(context).fontSize(3),
                                ),
                              ),
                              MyTextView(
                                "\$",
                                textAligntNew: TextAlign.start,
                                maxLineWrap: true,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.lightPinkColor,
                                  fontWeightNew: FontWeight.w600,
                                  size: ResponsiveFlutter.of(context)
                                      .fontSize(1.8),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(20)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckoutScreen(),
                            ),
                          );
                        },
                        child: commonButton(
                          context: context,
                          title: Strings.bookNow,
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
    );
  }
}
